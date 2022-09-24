import 'package:fatima/state_manager/src/controller/fatima_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fatima/fatima.dart';

class ConfigData {
  final ValueChanged<Routing?>? routingCallback;
  final Transition? defaultTransition;
  final bool? opaqueRoute;
  final VoidCallback? onInit;
  final VoidCallback? onReady;
  final VoidCallback? onDispose;
  final bool? enableLog;
  final LogWriterCallback? logWriterCallback;
  final bool? popGesture;
  final SmartManagement smartManagement;
  final List<Bind> binds;
  final Duration? transitionDuration;
  final bool? defaultGlobalState;
  final List<FatimaPage>? fatimaPages;
  final FatimaPage? unknownRoute;
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final List<NavigatorObserver>? navigatorObservers;
  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Map<String, Map<String, String>>? translationsKeys;
  final Translations? translations;
  final Locale? locale;
  final Locale? fallbackLocale;
  final String? initialRoute;
  final CustomTransition? customTransition;
  final Widget? home;

  final Color? primaryColor;

  ConfigData({
    required this.routingCallback,
    required this.defaultTransition,
    required this.opaqueRoute,
    required this.onInit,
    required this.onReady,
    required this.onDispose,
    required this.enableLog,
    required this.logWriterCallback,
    required this.popGesture,
    required this.smartManagement,
    required this.binds,
    required this.transitionDuration,
    required this.defaultGlobalState,
    required this.fatimaPages,
    required this.unknownRoute,
    required this.routeInformationProvider,
    required this.routeInformationParser,
    required this.routerDelegate,
    required this.backButtonDispatcher,
    required this.navigatorObservers,
    required this.navigatorKey,
    required this.scaffoldMessengerKey,
    required this.translationsKeys,
    required this.translations,
    required this.locale,
    required this.fallbackLocale,
    required this.initialRoute,
    required this.customTransition,
    required this.home,
    this.primaryColor,
  });
}

class FatimaMaterialController extends FullLifeCycleController {
  FatimaMaterialController(this.config);

  final _box = Storage();

  static FatimaMaterialController get to {
    return Fatima.find();
  }

  late final RouterDelegate<Object>? routerDelegate;
  late final RouteInformationParser<Object> routeInformationParser;
  final ConfigData config;

  @override
  void onReady() {
    config.onReady?.call();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();

    if (config.fatimaPages == null && config.home == null) {
      throw 'You need add pages or home';
    }

    routerDelegate = config.routerDelegate ??
        createDelegate(
          pages: config.fatimaPages ??
              [
                FatimaPage(
                  name: cleanRouteName("/${config.home.runtimeType}"),
                  page: () => config.home!,
                ),
              ],
          notFoundRoute: config.unknownRoute,
          navigatorKey: config.navigatorKey,
          navigatorObservers: (config.navigatorObservers == null
              ? <NavigatorObserver>[
                  FatimaObserver(config.routingCallback, Fatima.routing)
                ]
              : <NavigatorObserver>[
                  FatimaObserver(config.routingCallback, routing),
                  ...config.navigatorObservers!
                ]),
        );

    routeInformationParser = config.routeInformationParser ??
        createInformationParser(
          initialRoute: config.initialRoute ??
              config.fatimaPages?.first.name ??
              cleanRouteName("/${config.home.runtimeType}"),
        );

    if (config.locale != null) Fatima.locale = config.locale;

    if (config.fallbackLocale != null) {
      Fatima.fallbackLocale = config.fallbackLocale;
    }

    if (config.translations != null) {
      Fatima.addTranslations(config.translations!.keys);
    } else if (config.translationsKeys != null) {
      Fatima.addTranslations(config.translationsKeys!);
    }

    customTransition = config.customTransition;

    //Fatima.setDefaultDelegate(routerDelegate);
    Fatima.smartManagement = config.smartManagement;
    config.onInit?.call();

    Fatima.isLogEnable = config.enableLog ?? kDebugMode;
    Fatima.log = config.logWriterCallback ?? defaultLogWriterCallback;
    defaultTransition = config.defaultTransition;
    defaultOpaqueRoute = config.opaqueRoute ?? true;
    defaultPopGesture = config.popGesture ?? FatimaPlatform.isIOS;
    defaultTransitionDuration =
        config.transitionDuration ?? const Duration(milliseconds: 300);

    // defaultTransitionCurve = Curves.easeOutQuad;
    // defaultDialogTransitionCurve = Curves.easeOutQuad;
    // defaultDialogTransitionDuration = Duration(milliseconds: 300);

    theme = ThemeData(
        fontFamily: 'IranYekan',
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //   foregroundColor: Colors.white,
        //   backgroundColor: const Color(0xE8212121),
        //   padding: const EdgeInsets.all(10.0),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //   ),
        // )),
        colorScheme: ColorScheme.light(
          primary: _box.read<int>("primaryColor") != null
              ? Color(_box.read<int>("primaryColor")!)
              : (config.primaryColor ?? Colors.blue),
        ));

    darkTheme = ThemeData(
        fontFamily: 'IranYekan',
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xE8212121),
          padding: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        )),
        colorScheme: ColorScheme.dark(
          primary: _box.read<int>("primaryColor") != null
              ? Color(_box.read<int>("primaryColor")!)
              : (config.primaryColor ?? Colors.blue),
        ));
  }

  String cleanRouteName(String name) {
    name = name.replaceAll('() => ', '');

    /// uncommonent for URL styling.
    // name = name.paramCase!;
    if (!name.startsWith('/')) {
      name = '/$name';
    }
    return Uri.tryParse(name)?.toString() ?? name;
  }

  bool testMode = false;
  Key? unikey;
  ThemeData? theme;
  ThemeData? darkTheme;
  ThemeMode? themeMode;

  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  bool defaultPopGesture = FatimaPlatform.isIOS;
  bool defaultOpaqueRoute = true;
  Transition? defaultTransition;
  Duration defaultTransitionDuration = Duration(milliseconds: 300);
  Curve defaultTransitionCurve = Curves.easeOutQuad;
  Curve defaultDialogTransitionCurve = Curves.easeOutQuad;
  Duration defaultDialogTransitionDuration = Duration(milliseconds: 300);

  final routing = Routing();

  Map<String, String?> parameters = {};
  CustomTransition? customTransition;

  Map<dynamic, FatimaDelegate> keys = {};

  GlobalKey<NavigatorState> get key => rootDelegate.navigatorKey;

  FatimaDelegate get rootDelegate => routerDelegate as FatimaDelegate;

  GlobalKey<NavigatorState>? addKey(GlobalKey<NavigatorState> newKey) {
    rootDelegate.navigatorKey = newKey;
    return key;
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    Fatima.asap(() {
      final locale = Fatima.deviceLocale;
      if (locale != null) {
        Fatima.updateLocale(locale);
      }
    });
  }

  void restartApp() {
    unikey = UniqueKey();
    update();
  }

  void setTheme(ThemeData value) {
    if (darkTheme == null) {
      theme = value;
    } else {
      if (value.brightness == Brightness.light) {
        theme = value;
      } else {
        darkTheme = value;
      }
    }
    update();
  }

  void setThemeMode(ThemeMode value) {
    themeMode = value;
    update();
  }

  void toggleThemeMode() {
    themeMode =
        (themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
    update();
  }

  void changePrimaryColor(Color color) {
    _box.write("primaryColor", color.value);

    theme = theme!.copyWith(
        colorScheme: ColorScheme.light(
      primary: color,
    ));
    darkTheme = darkTheme!.copyWith(
        colorScheme: ColorScheme.dark(
      primary: color,
    ));
    update();
  }

  FatimaDelegate? nestedKey(String? key) {
    if (key == null) {
      return routerDelegate as FatimaDelegate;
    }
    keys.putIfAbsent(
      key,
      () => FatimaDelegate(
        showHashOnUrl: true,
        //debugLabel: 'Getx nested key: ${key.toString()}',
        pages: RouteDecoder.fromRoute(key).currentChildrens ?? [],
      ),
    );
    return keys[key];
  }

  FatimaInformationParser createInformationParser({String initialRoute = '/'}) {
    return FatimaInformationParser(
      initialRoute: initialRoute,
    );
  }

  // static GetDelegate? _delegate;

  FatimaDelegate createDelegate({
    FatimaPage<dynamic>? notFoundRoute,
    List<FatimaPage> pages = const [],
    List<NavigatorObserver>? navigatorObservers,
    TransitionDelegate<dynamic>? transitionDelegate,
    PopMode backButtonPopMode = PopMode.history,
    PreventDuplicateHandlingMode preventDuplicateHandlingMode =
        PreventDuplicateHandlingMode.reorderRoutes,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    return FatimaDelegate(
      notFoundRoute: notFoundRoute,
      navigatorObservers: navigatorObservers,
      transitionDelegate: transitionDelegate,
      backButtonPopMode: backButtonPopMode,
      preventDuplicateHandlingMode: preventDuplicateHandlingMode,
      pages: pages,
      navigatorKey: navigatorKey,
    );
  }
}
