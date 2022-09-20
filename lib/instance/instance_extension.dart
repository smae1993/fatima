import 'package:fatima/fatima.dart';
import 'package:fatima/fatima_interface.dart';
import 'package:fatima/navigation/router_report.dart';
import 'package:fatima/state_manager/controller/lifecycle.dart';
import 'package:fatima/core/smart_management.dart';
import 'package:flutter/material.dart';

class InstanceInfo {
  final bool? isPermanent;
  final bool? isSingleton;
  bool get isCreate => !isSingleton!;
  final bool isRegistered;
  final bool isPrepared;
  final bool? isInit;
  const InstanceInfo({
    required this.isPermanent,
    required this.isSingleton,
    required this.isRegistered,
    required this.isPrepared,
    required this.isInit,
  });
}

extension Inst on FatimaInterface {
  T call<T>() => find<T>();

  /// Holds references to every registered Instance when using
  /// `Get.put()`
  static final Map<String, _InstanceBuilderFactory> _singl = {};

  /// Holds a reference to every registered callback when using
  /// `Get.lazyPut()`
  // static final Map<String, _Lazy> _factory = {};

  // void injector<S>(
  //   InjectorBuilderCallback<S> fn, {
  //   String? tag,
  //   bool fenix = false,
  //   //  bool permanent = false,
  // }) {
  //   lazyPut(
  //     () => fn(this),
  //     tag: tag,
  //     fenix: fenix,
  //     // permanent: permanent,
  //   );
  // }

  C register<C>(
    C dependency, {
    String? tag,
    bool permanent = false,
  }) {
    _insert(
        isSingleton: true,
        name: tag,
        permanent: permanent,
        builder: (() => dependency));
    return find<C>(tag: tag);
  }

  /// Creates a new Instance<S> lazily from the `<S>builder()` callback.
  ///
  /// The first time you call `Get.find()`, the `builder()` callback will create
  /// the Instance and persisted as a Singleton (like you would
  /// use `Get.put()`).
  ///
  /// Using `Get.smartManagement` as [SmartManagement.keepFactory] has
  /// the same outcome as using `fenix:true` :
  /// The internal register of `builder()` will remain in memory to recreate
  /// the Instance if the Instance has been removed with `Get.delete()`.
  /// Therefore, future calls to `Get.find()` will return the same Instance.
  ///
  /// If you need to make use of GetxController's life-cycle
  /// (`onInit(), onStart(), onClose()`) [fenix] is a great choice to mix with
  /// `GetBuilder()` and `GetX()` widgets, and/or `GetMaterialApp` Navigation.
  ///
  /// You could use `Get.lazyPut(fenix:true)` in your app's `main()` instead
  /// of `Bindings()` for each `GetPage`.
  /// And the memory management will be similar.
  ///
  /// Subsequent calls to `Get.lazyPut()` with the same parameters
  /// (<[S]> and optionally [tag] will **not** override the original).
  void lazyPut<S>(
    InstanceBuilderCallback<S> builder, {
    String? tag,
    bool? fenix,
    bool permanent = false,
  }) {
    _insert(
      isSingleton: true,
      name: tag,
      permanent: permanent,
      builder: builder,
      fenix: fenix ?? Fatima.smartManagement == SmartManagement.keepFactory,
    );
  }

  /// Creates a new Class Instance [S] from the builder callback[S].
  /// Every time [find]<[S]>() is used, it calls the builder method to generate
  /// a new Instance [S].
  /// It also registers each `instance.onClose()` with the current
  /// Route `Get.reference` to keep the lifecycle active.
  /// Is important to know that the instances created are only stored per Route.
  /// So, if you call `Get.delete<T>()` the "instance factory" used in this
  /// method (`Get.create<T>()`) will be removed, but NOT the instances
  /// already created by it.
  ///
  /// Example:
  ///
  /// ```create(() => Repl());
  /// Repl a = find();
  /// Repl b = find();
  /// print(a==b); (false)```
  void create<S>(
    InstanceBuilderCallback<S> builder, {
    String? tag,
    bool permanent = true,
  }) {
    _insert(
      isSingleton: false,
      name: tag,
      builder: builder,
      permanent: permanent,
    );
  }

  /// Injects the Instance [S] builder into the `_singleton` HashMap.
  void _insert<S>({
    bool? isSingleton,
    String? name,
    bool permanent = false,
    required InstanceBuilderCallback<S> builder,
    bool fenix = false,
  }) {
    final key = _getKey(S, name);

    _InstanceBuilderFactory<S>? dep;
    if (_singl.containsKey(key)) {
      final _dep = _singl[key];
      if (_dep == null || !_dep.isDirty) {
        return;
      } else {
        dep = _dep as _InstanceBuilderFactory<S>;
      }
    }
    _singl[key] = _InstanceBuilderFactory<S>(
      isSingleton: isSingleton,
      builderFunc: builder,
      permanent: permanent,
      isInit: false,
      fenix: fenix,
      tag: name,
      lateRemove: dep,
    );
  }

  /// Initializes the dependencies for a Class Instance [S] (or tag),
  /// If its a Controller, it starts the lifecycle process.
  /// Optionally associating the current Route to the lifetime of the instance,
  /// if `Get.smartManagement` is marked as [SmartManagement.full] or
  /// [SmartManagement.keepFactory]
  /// Only flags `isInit` if it's using `Get.create()`
  /// (not for Singletons access).
  /// Returns the instance if not initialized, required for Get.create() to
  /// work properly.
  S? _initDependencies<S>({String? name}) {
    final key = _getKey(S, name);
    final isInit = _singl[key]!.isInit;
    S? i;
    if (!isInit) {
      i = _startController<S>(tag: name);
      if (_singl[key]!.isSingleton!) {
        _singl[key]!.isInit = true;
        if (Fatima.smartManagement != SmartManagement.onlyBuilder) {
          RouterReportManager.instance
              .reportDependencyLinkedToRoute(_getKey(S, name));
        }
      }
    }
    return i;
  }

  InstanceInfo getInstanceInfo<S>({String? tag}) {
    final build = _getDependency<S>(tag: tag);

    return InstanceInfo(
      isPermanent: build?.permanent,
      isSingleton: build?.isSingleton,
      isRegistered: isRegistered<S>(tag: tag),
      isPrepared: !(build?.isInit ?? true),
      isInit: build?.isInit,
    );
  }

  _InstanceBuilderFactory? _getDependency<S>({String? tag, String? key}) {
    final newKey = key ?? _getKey(S, tag);

    if (!_singl.containsKey(newKey)) {
      Fatima.log('Instance "$newKey" is not registered.', isError: true);
      return null;
    } else {
      return _singl[newKey];
    }
  }

  void markAsDirty<S>({String? tag, String? key}) {
    final newKey = key ?? _getKey(S, tag);
    if (_singl.containsKey(newKey)) {
      final dep = _singl[newKey];
      if (dep != null && !dep.permanent) {
        dep.isDirty = true;
      }
    }
  }

  /// Initializes the controller
  S _startController<S>({String? tag}) {
    final key = _getKey(S, tag);
    final i = _singl[key]!.getDependency() as S;
    if (i is LifeCycleMixin) {
      i.onStart();
      if (tag == null) {
        Fatima.log('Instance "$S" has been initialized');
      } else {
        Fatima.log('Instance "$S" with tag "$tag" has been initialized');
      }
      if (!_singl[key]!.isSingleton!) {
        RouterReportManager.instance.appendRouteByCreate(i);
      }
    }
    return i;
  }

  S putOrFind<S>(InstanceBuilderCallback<S> dep, {String? tag}) {
    final key = _getKey(S, tag);

    if (_singl.containsKey(key)) {
      return _singl[key]!.getDependency() as S;
    } else {
      return register(dep(), tag: tag);
    }
  }

  /// Finds the registered type <[S]> (or [tag])
  /// In case of using Get.[create] to register a type <[S]> or [tag],
  /// it will create an instance each time you call [find].
  /// If the registered type <[S]> (or [tag]) is a Controller,
  /// it will initialize it's lifecycle.
  S find<S>({String? tag}) {
    final key = _getKey(S, tag);
    if (isRegistered<S>(tag: tag)) {
      final dep = _singl[key];
      if (dep == null) {
        if (tag == null) {
          throw 'Class "$S" is not registered';
        } else {
          throw 'Class "$S" with tag "$tag" is not registered';
        }
      }

      /// although dirty solution, the lifecycle starts inside
      /// `initDependencies`, so we have to return the instance from there
      /// to make it compatible with `Get.create()`.
      final i = _initDependencies<S>(name: tag);
      return i ?? dep.getDependency() as S;
    } else {
      // ignore: lines_longer_than_80_chars
      throw '"$S" not found. You need to call "Get.put($S())" or "Get.lazyPut(()=>$S())"';
    }
  }

  /// Replace a parent instance of a class in dependency management
  /// with a [child] instance
  /// - [tag] optional, if you use a [tag] to register the Instance.
  void replace<P>(P child, {String? tag}) {
    final info = getInstanceInfo<P>(tag: tag);
    final permanent = (info.isPermanent ?? false);
    delete<P>(tag: tag, force: permanent);
    register(child, tag: tag, permanent: permanent);
  }

  /// Replaces a parent instance with a new Instance<P> lazily from the
  /// `<P>builder()` callback.
  /// - [tag] optional, if you use a [tag] to register the Instance.
  /// - [fenix] optional
  ///
  ///  Note: if fenix is not provided it will be set to true if
  /// the parent instance was permanent
  void lazyReplace<P>(InstanceBuilderCallback<P> builder,
      {String? tag, bool? fenix}) {
    final info = getInstanceInfo<P>(tag: tag);
    final permanent = (info.isPermanent ?? false);
    delete<P>(tag: tag, force: permanent);
    lazyPut(builder, tag: tag, fenix: fenix ?? permanent);
  }

  /// Generates the key based on [type] (and optionally a [name])
  /// to register an Instance Builder in the hashmap.
  String _getKey(Type type, String? name) {
    return name == null ? type.toString() : type.toString() + name;
  }

  /// Clears all registered instances (and/or tags).
  /// Even the persistent ones.
  /// This should be used at the end or tearDown of unit tests.
  ///
  /// `clearFactory` clears the callbacks registered by [lazyPut]
  /// `clearRouteBindings` clears Instances associated with routes.
  ///
  bool resetInstance({bool clearRouteBindings = true}) {
    //  if (clearFactory) _factory.clear();
    // deleteAll(force: true);
    if (clearRouteBindings) RouterReportManager.instance.clearRouteKeys();
    _singl.clear();

    return true;
  }

  /// Delete registered Class Instance [S] (or [tag]) and, closes any open
  /// controllers `DisposableInterface`, cleans up the memory
  ///
  /// /// Deletes the Instance<[S]>, cleaning the memory.
  //  ///
  //  /// - [tag] Optional "tag" used to register the Instance
  //  /// - [key] For internal usage, is the processed key used to register
  //  ///   the Instance. **don't use** it unless you know what you are doing.

  /// Deletes the Instance<[S]>, cleaning the memory and closes any open
  /// controllers (`DisposableInterface`).
  ///
  /// - [tag] Optional "tag" used to register the Instance
  /// - [key] For internal usage, is the processed key used to register
  ///   the Instance. **don't use** it unless you know what you are doing.
  /// - [force] Will delete an Instance even if marked as `permanent`.
  bool delete<S>({String? tag, String? key, bool force = false}) {
    final newKey = key ?? _getKey(S, tag);

    if (!_singl.containsKey(newKey)) {
      Fatima.log('Instance "$newKey" already removed.', isError: true);
      return false;
    }

    final dep = _singl[newKey];

    if (dep == null) return false;

    final _InstanceBuilderFactory builder;
    if (dep.isDirty) {
      builder = dep.lateRemove ?? dep;
    } else {
      builder = dep;
    }

    if (builder.permanent && !force) {
      Fatima.log(
        // ignore: lines_longer_than_80_chars
        '"$newKey" has been marked as permanent, SmartManagement is not authorized to delete it.',
        isError: true,
      );
      return false;
    }
    final i = builder.dependency;

    if (i is GetxServiceMixin && !force) {
      return false;
    }

    if (i is LifeCycleMixin) {
      i.onDelete();
      Fatima.log('"$newKey" onDelete() called');
    }

    if (builder.fenix) {
      builder.dependency = null;
      builder.isInit = false;
      return true;
    } else {
      if (dep.lateRemove != null) {
        dep.lateRemove = null;
        Fatima.log('"$newKey" deleted from memory');
        return false;
      } else {
        _singl.remove(newKey);
        if (_singl.containsKey(newKey)) {
          Fatima.log('Error removing object "$newKey"', isError: true);
        } else {
          Fatima.log('"$newKey" deleted from memory');
        }
        return true;
      }
    }
  }

  /// Delete all registered Class Instances and, closes any open
  /// controllers `DisposableInterface`, cleans up the memory
  ///
  /// - [force] Will delete the Instances even if marked as `permanent`.
  void deleteAll({bool force = false}) {
    final keys = _singl.keys.toList();
    for (final key in keys) {
      delete(key: key, force: force);
    }
  }

  void reloadAll({bool force = false}) {
    _singl.forEach((key, value) {
      if (value.permanent && !force) {
        Fatima.log('Instance "$key" is permanent. Skipping reload');
      } else {
        value.dependency = null;
        value.isInit = false;
        Fatima.log('Instance "$key" was reloaded.');
      }
    });
  }

  void reload<S>({
    String? tag,
    String? key,
    bool force = false,
  }) {
    final newKey = key ?? _getKey(S, tag);

    final builder = _getDependency<S>(tag: tag, key: newKey);
    if (builder == null) return;

    if (builder.permanent && !force) {
      Fatima.log(
        '''Instance "$newKey" is permanent. Use [force = true] to force the restart.''',
        isError: true,
      );
      return;
    }

    final i = builder.dependency;

    if (i is GetxServiceMixin && !force) {
      return;
    }

    if (i is LifeCycleMixin) {
      i.onDelete();
      Fatima.log('"$newKey" onDelete() called');
    }

    builder.dependency = null;
    builder.isInit = false;
    Fatima.log('Instance "$newKey" was restarted.');
  }

  /// Check if a Class Instance<[S]> (or [tag]) is registered in memory.
  /// - [tag] is optional, if you used a [tag] to register the Instance.
  bool isRegistered<S>({String? tag}) => _singl.containsKey(_getKey(S, tag));

  /// Checks if a lazy factory callback `Get.lazyPut()` that returns an
  /// Instance<[S]> is registered in memory.
  /// - [tag] is optional, if you used a [tag] to register the lazy Instance.
  bool isPrepared<S>({String? tag}) {
    final newKey = _getKey(S, tag);

    final builder = _getDependency<S>(tag: tag, key: newKey);
    if (builder == null) {
      return false;
    }

    if (!builder.isInit) {
      return true;
    }
    return false;
  }
}

typedef InstanceBuilderCallback<S> = S Function();

typedef InstanceCreateBuilderCallback<S> = S Function(BuildContext _);

// typedef InstanceBuilderCallback<S> = S Function();

// typedef InjectorBuilderCallback<S> = S Function(Inst);

typedef AsyncInstanceBuilderCallback<S> = Future<S> Function();

/// Internal class to register instances with `Get.put<S>()`.
class _InstanceBuilderFactory<S> {
  /// Marks the Builder as a single instance.
  /// For reusing [dependency] instead of [builderFunc]
  bool? isSingleton;

  /// When fenix mode is avaliable, when a new instance is need
  /// Instance manager will recreate a new instance of S
  bool fenix;

  /// Stores the actual object instance when [isSingleton]=true.
  S? dependency;

  /// Generates (and regenerates) the instance when [isSingleton]=false.
  /// Usually used by factory methods
  InstanceBuilderCallback<S> builderFunc;

  /// Flag to persist the instance in memory,
  /// without considering `Get.smartManagement`
  bool permanent = false;

  bool isInit = false;

  _InstanceBuilderFactory<S>? lateRemove;

  bool isDirty = false;

  String? tag;

  _InstanceBuilderFactory({
    required this.isSingleton,
    required this.builderFunc,
    required this.permanent,
    required this.isInit,
    required this.fenix,
    required this.tag,
    required this.lateRemove,
  });

  void _showInitLog() {
    if (tag == null) {
      Fatima.log('Instance "$S" has been created');
    } else {
      Fatima.log('Instance "$S" has been created with tag "$tag"');
    }
  }

  /// Gets the actual instance by it's [builderFunc] or the persisted instance.
  S getDependency() {
    if (isSingleton!) {
      if (dependency == null) {
        _showInitLog();
        dependency = builderFunc();
      }
      return dependency!;
    } else {
      return builderFunc();
    }
  }
}
