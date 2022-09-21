import 'dart:async';
import 'dart:ui';

// import 'package:fatima/fatima_main.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_core/get_core.dart';

import 'package:fatima/fatima.dart';

// import '../../../get_core/get_core.dart';
// import '../../fatima_navigation.dart';

typedef OnTap = void Function(FatimaSnackBar snack);

typedef SnackbarStatusCallback = void Function(SnackbarStatus? status);

@Deprecated('use FatimaSnackBar')
class FatimaBar extends FatimaSnackBar {
  FatimaBar({
    Key? key,
    String? title,
    String? message,
    Widget? titleText,
    Widget? messageText,
    Widget? icon,
    bool shouldIconPulse = true,
    double? maxWidth,
    EdgeInsets margin = const EdgeInsets.all(0.0),
    EdgeInsets padding = const EdgeInsets.all(16),
    double borderRadius = 0.0,
    Color? borderColor,
    double borderWidth = 1.0,
    Color backgroundColor = const Color(0xFF303030),
    Color? leftBarIndicatorColor,
    List<BoxShadow>? boxShadows,
    Gradient? backgroundGradient,
    Widget? mainButton,
    OnTap? onTap,
    Duration? duration,
    bool isDismissible = true,
    DismissDirection? dismissDirection,
    bool showProgressIndicator = false,
    AnimationController? progressIndicatorController,
    Color? progressIndicatorBackgroundColor,
    Animation<Color>? progressIndicatorValueColor,
    SnackPosition snackPosition = SnackPosition.bottom,
    SnackStyle snackStyle = SnackStyle.floating,
    Curve forwardAnimationCurve = Curves.easeOutCirc,
    Curve reverseAnimationCurve = Curves.easeOutCirc,
    Duration animationDuration = const Duration(seconds: 1),
    double barBlur = 0.0,
    double overlayBlur = 0.0,
    Color overlayColor = Colors.transparent,
    Form? userInputForm,
    SnackbarStatusCallback? snackbarStatus,
  }) : super(
          key: key,
          title: title,
          message: message,
          titleText: titleText,
          messageText: messageText,
          icon: icon,
          shouldIconPulse: shouldIconPulse,
          maxWidth: maxWidth,
          margin: margin,
          padding: padding,
          borderRadius: borderRadius,
          borderColor: borderColor,
          borderWidth: borderWidth,
          backgroundColor: backgroundColor,
          leftBarIndicatorColor: leftBarIndicatorColor,
          boxShadows: boxShadows,
          backgroundGradient: backgroundGradient,
          mainButton: mainButton,
          onTap: onTap,
          duration: duration,
          isDismissible: isDismissible,
          dismissDirection: dismissDirection,
          showProgressIndicator: showProgressIndicator,
          progressIndicatorController: progressIndicatorController,
          progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
          progressIndicatorValueColor: progressIndicatorValueColor,
          snackPosition: snackPosition,
          snackStyle: snackStyle,
          forwardAnimationCurve: forwardAnimationCurve,
          reverseAnimationCurve: reverseAnimationCurve,
          animationDuration: animationDuration,
          barBlur: barBlur,
          overlayBlur: overlayBlur,
          overlayColor: overlayColor,
          userInputForm: userInputForm,
          snackbarStatus: snackbarStatus,
        );
}

class FatimaSnackBar extends StatefulWidget {
  /// A callback for you to listen to the different Snack status
  final SnackbarStatusCallback? snackbarStatus;

  /// The title displayed to the user
  final String? title;

  /// The direction in which the SnackBar can be dismissed.
  ///
  /// Default is [DismissDirection.down] when
  /// [snackPosition] == [SnackPosition.BOTTOM] and [DismissDirection.up]
  /// when [snackPosition] == [SnackPosition.TOP]
  final DismissDirection? dismissDirection;

  /// The message displayed to the user.
  final String? message;

  /// Replaces [title]. Although this accepts a [Widget], it is meant
  /// to receive [Text] or [RichText]
  final Widget? titleText;

  /// Replaces [message]. Although this accepts a [Widget], it is meant
  /// to receive [Text] or  [RichText]
  final Widget? messageText;

  /// Will be ignored if [backgroundGradient] is not null
  final Color backgroundColor;

  /// If not null, shows a left vertical colored bar on notification.
  /// It is not possible to use it with a [Form] and I do not recommend
  /// using it with [LinearProgressIndicator]
  final Color? leftBarIndicatorColor;

  /// [boxShadows] The shadows generated by Snack. Leave it null
  /// if you don't want a shadow.
  /// You can use more than one if you feel the need.
  /// Check (this example)[https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/shadows.dart]
  final List<BoxShadow>? boxShadows;

  /// Give to GetSnackbar a gradient background.
  /// It Makes [backgroundColor] be ignored.
  final Gradient? backgroundGradient;

  /// You can use any widget here, but I recommend [Icon] or [Image] as
  /// indication of what kind
  /// of message you are displaying. Other widgets may break the layout
  final Widget? icon;

  /// An option to animate the icon (if present). Defaults to true.
  final bool shouldIconPulse;

  /// (optional) An action that the user can take based on the snack bar.
  ///
  /// For example, the snack bar might let the user undo the operation that
  /// prompted the snackbar.
  final Widget? mainButton;

  /// A callback that registers the user's click anywhere.
  /// An alternative to [mainButton]
  final OnTap? onTap;

  /// How long until Snack will hide itself (be dismissed).
  /// To make it indefinite, leave it null.
  final Duration? duration;

  /// True if you want to show a [LinearProgressIndicator].
  final bool showProgressIndicator;

  /// An optional [AnimationController] when you want to control the
  /// progress of your [LinearProgressIndicator].
  final AnimationController? progressIndicatorController;

  /// A [LinearProgressIndicator] configuration parameter.
  final Color? progressIndicatorBackgroundColor;

  /// A [LinearProgressIndicator] configuration parameter.
  final Animation<Color>? progressIndicatorValueColor;

  /// Determines if the user can swipe or click the overlay
  /// (if [overlayBlur] > 0) to dismiss.
  /// It is recommended that you set [duration] != null if this is false.
  /// If the user swipes to dismiss or clicks the overlay, no value
  /// will be returned.
  final bool isDismissible;

  /// Used to limit Snack width (usually on large screens)
  final double? maxWidth;

  /// Adds a custom margin to Snack
  final EdgeInsets margin;

  /// Adds a custom padding to Snack
  /// The default follows material design guide line
  final EdgeInsets padding;

  /// Adds a radius to all corners of Snack. Best combined with [margin].
  /// I do not recommend using it with [showProgressIndicator]
  /// or [leftBarIndicatorColor].
  final double borderRadius;

  /// Adds a border to every side of Snack
  /// I do not recommend using it with [showProgressIndicator]
  /// or [leftBarIndicatorColor].
  final Color? borderColor;

  /// Changes the width of the border if [borderColor] is specified
  final double? borderWidth;

  /// Snack can be based on [SnackPosition.TOP] or on [SnackPosition.BOTTOM]
  /// of your screen.
  /// [SnackPosition.BOTTOM] is the default.
  final SnackPosition snackPosition;

  /// Snack can be floating or be grounded to the edge of the screen.
  /// If grounded, I do not recommend using [margin] or [borderRadius].
  /// [SnackStyle.FLOATING] is the default
  /// If grounded, I do not recommend using a [backgroundColor] with
  /// transparency or [barBlur]
  final SnackStyle snackStyle;

  /// The [Curve] animation used when show() is called.
  /// [Curves.easeOut] is default
  final Curve forwardAnimationCurve;

  /// The [Curve] animation used when dismiss() is called.
  /// [Curves.fastOutSlowIn] is default
  final Curve reverseAnimationCurve;

  /// Use it to speed up or slow down the animation duration
  final Duration animationDuration;

  /// Default is 0.0. If different than 0.0, blurs only Snack's background.
  /// To take effect, make sure your [backgroundColor] has some opacity.
  /// The greater the value, the greater the blur.
  final double barBlur;

  /// Default is 0.0. If different than 0.0, creates a blurred
  /// overlay that prevents the user from interacting with the screen.
  /// The greater the value, the greater the blur.
  final double overlayBlur;

  /// Default is [Colors.transparent]. Only takes effect if [overlayBlur] > 0.0.
  /// Make sure you use a color with transparency here e.g.
  /// Colors.grey[600].withOpacity(0.2).
  final Color? overlayColor;

  /// A [TextFormField] in case you want a simple user input.
  /// Every other widget is ignored if this is not null.
  final Form? userInputForm;

  const FatimaSnackBar({
    Key? key,
    this.title,
    this.message,
    this.titleText,
    this.messageText,
    this.icon,
    this.shouldIconPulse = true,
    this.maxWidth,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 0.0,
    this.borderColor,
    this.borderWidth = 1.0,
    this.backgroundColor = const Color(0xFF303030),
    this.leftBarIndicatorColor,
    this.boxShadows,
    this.backgroundGradient,
    this.mainButton,
    this.onTap,
    this.duration,
    this.isDismissible = true,
    this.dismissDirection,
    this.showProgressIndicator = false,
    this.progressIndicatorController,
    this.progressIndicatorBackgroundColor,
    this.progressIndicatorValueColor,
    this.snackPosition = SnackPosition.bottom,
    this.snackStyle = SnackStyle.floating,
    this.forwardAnimationCurve = Curves.easeOutCirc,
    this.reverseAnimationCurve = Curves.easeOutCirc,
    this.animationDuration = const Duration(seconds: 1),
    this.barBlur = 0.0,
    this.overlayBlur = 0.0,
    this.overlayColor = Colors.transparent,
    this.userInputForm,
    this.snackbarStatus,
  }) : super(key: key);

  @override
  State createState() => FatimaSnackBarState();

  /// Show the snack. It's call [SnackbarStatus.OPENING] state
  /// followed by [SnackbarStatus.OPEN]
  SnackbarController show() {
    return Fatima.showSnackbar(this);
  }
}

class FatimaSnackBarState extends State<FatimaSnackBar>
    with TickerProviderStateMixin {
  AnimationController? _fadeController;
  late Animation<double> _fadeAnimation;

  final Widget _emptyWidget = SizedBox(width: 0.0, height: 0.0);
  final double _initialOpacity = 1.0;
  final double _finalOpacity = 0.4;

  final Duration _pulseAnimationDuration = Duration(seconds: 1);

  late bool _isTitlePresent;
  late double _messageTopMargin;

  FocusScopeNode? _focusNode;
  late FocusAttachment _focusAttachment;

  final Completer<Size> _boxHeightCompleter = Completer<Size>();

  late CurvedAnimation _progressAnimation;

  final _backgroundBoxKey = GlobalKey();

  double get buttonPadding {
    if (widget.padding.right - 12 < 0) {
      return 4;
    } else {
      return widget.padding.right - 12;
    }
  }

  RowStyle get _rowStyle {
    if (widget.mainButton != null && widget.icon == null) {
      return RowStyle.action;
    } else if (widget.mainButton == null && widget.icon != null) {
      return RowStyle.icon;
    } else if (widget.mainButton != null && widget.icon != null) {
      return RowStyle.all;
    } else {
      return RowStyle.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: 1.0,
      child: Material(
        color: widget.snackStyle == SnackStyle.floating
            ? Colors.transparent
            : widget.backgroundColor,
        child: SafeArea(
          minimum: widget.snackPosition == SnackPosition.bottom
              ? EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom)
              : EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          bottom: widget.snackPosition == SnackPosition.bottom,
          top: widget.snackPosition == SnackPosition.top,
          left: false,
          right: false,
          child: Stack(
            children: [
              FutureBuilder<Size>(
                future: _boxHeightCompleter.future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (widget.barBlur == 0) {
                      return _emptyWidget;
                    }
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: widget.barBlur, sigmaY: widget.barBlur),
                        child: Container(
                          height: snapshot.data!.height,
                          width: snapshot.data!.width,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return _emptyWidget;
                  }
                },
              ),
              if (widget.userInputForm != null)
                _containerWithForm()
              else
                _containerWithoutForm()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fadeController?.dispose();
    widget.progressIndicatorController?.removeListener(_updateProgress);
    widget.progressIndicatorController?.dispose();

    _focusAttachment.detach();
    _focusNode!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    assert(
        widget.userInputForm != null ||
            ((widget.message != null && widget.message!.isNotEmpty) ||
                widget.messageText != null),
        '''
You need to either use message[String], or messageText[Widget] or define a userInputForm[Form] in GetSnackbar''');

    _isTitlePresent = (widget.title != null || widget.titleText != null);
    _messageTopMargin = _isTitlePresent ? 6.0 : widget.padding.top;

    _configureLeftBarFuture();
    _configureProgressIndicatorAnimation();

    if (widget.icon != null && widget.shouldIconPulse) {
      _configurePulseAnimation();
      _fadeController?.forward();
    }

    _focusNode = FocusScopeNode();
    _focusAttachment = _focusNode!.attach(context);
  }

  Widget _buildLeftBarIndicator() {
    if (widget.leftBarIndicatorColor != null) {
      return FutureBuilder<Size>(
        future: _boxHeightCompleter.future,
        builder: (buildContext, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: widget.leftBarIndicatorColor,
              width: 5.0,
              height: snapshot.data!.height,
            );
          } else {
            return _emptyWidget;
          }
        },
      );
    } else {
      return _emptyWidget;
    }
  }

  void _configureLeftBarFuture() {
    ambiguate(Engine.instance)!.addPostFrameCallback(
      (_) {
        final keyContext = _backgroundBoxKey.currentContext;
        if (keyContext != null) {
          final box = keyContext.findRenderObject() as RenderBox;
          _boxHeightCompleter.complete(box.size);
        }
      },
    );
  }

  void _configureProgressIndicatorAnimation() {
    if (widget.showProgressIndicator &&
        widget.progressIndicatorController != null) {
      widget.progressIndicatorController!.addListener(_updateProgress);

      _progressAnimation = CurvedAnimation(
          curve: Curves.linear, parent: widget.progressIndicatorController!);
    }
  }

  void _configurePulseAnimation() {
    _fadeController =
        AnimationController(vsync: this, duration: _pulseAnimationDuration);
    _fadeAnimation = Tween(begin: _initialOpacity, end: _finalOpacity).animate(
      CurvedAnimation(
        parent: _fadeController!,
        curve: Curves.linear,
      ),
    );

    _fadeController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeController!.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _fadeController!.forward();
      }
    });

    _fadeController!.forward();
  }

  Widget _containerWithForm() {
    return Container(
      key: _backgroundBoxKey,
      constraints: widget.maxWidth != null
          ? BoxConstraints(maxWidth: widget.maxWidth!)
          : null,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.backgroundGradient,
        boxShadow: widget.boxShadows,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: widget.borderColor != null
            ? Border.all(
                color: widget.borderColor!,
                width: widget.borderWidth!,
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 8.0, bottom: 8.0, top: 16.0),
        child: FocusScope(
          child: widget.userInputForm!,
          node: _focusNode,
          autofocus: true,
        ),
      ),
    );
  }

  Widget _containerWithoutForm() {
    final iconPadding = widget.padding.left > 16.0 ? widget.padding.left : 0.0;
    final left = _rowStyle == RowStyle.icon || _rowStyle == RowStyle.all
        ? 4.0
        : widget.padding.left;
    final right = _rowStyle == RowStyle.action || _rowStyle == RowStyle.all
        ? 8.0
        : widget.padding.right;
    return Container(
      key: _backgroundBoxKey,
      constraints: widget.maxWidth != null
          ? BoxConstraints(maxWidth: widget.maxWidth!)
          : null,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.backgroundGradient,
        boxShadow: widget.boxShadows,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: widget.borderColor != null
            ? Border.all(color: widget.borderColor!, width: widget.borderWidth!)
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.showProgressIndicator
              ? LinearProgressIndicator(
                  value: widget.progressIndicatorController != null
                      ? _progressAnimation.value
                      : null,
                  backgroundColor: widget.progressIndicatorBackgroundColor,
                  valueColor: widget.progressIndicatorValueColor,
                )
              : _emptyWidget,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildLeftBarIndicator(),
              if (_rowStyle == RowStyle.icon || _rowStyle == RowStyle.all)
                ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 42.0 + iconPadding),
                  child: _getIcon(),
                ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (_isTitlePresent)
                      Padding(
                        padding: EdgeInsets.only(
                          top: widget.padding.top,
                          left: left,
                          right: right,
                        ),
                        child: widget.titleText ??
                            Text(
                              widget.title ?? "",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      )
                    else
                      _emptyWidget,
                    Padding(
                      padding: EdgeInsets.only(
                        top: _messageTopMargin,
                        left: left,
                        right: right,
                        bottom: widget.padding.bottom,
                      ),
                      child: widget.messageText ??
                          Text(
                            widget.message ?? "",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                    ),
                  ],
                ),
              ),
              if (_rowStyle == RowStyle.action || _rowStyle == RowStyle.all)
                Padding(
                  padding: EdgeInsets.only(right: buttonPadding),
                  child: widget.mainButton,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget? _getIcon() {
    if (widget.icon != null && widget.icon is Icon && widget.shouldIconPulse) {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: widget.icon,
      );
    } else if (widget.icon != null) {
      return widget.icon;
    } else {
      return _emptyWidget;
    }
  }

  void _updateProgress() => setState(() {});
}

enum RowStyle {
  icon,
  action,
  all,
  none,
}

/// Indicates Status of snackbar
/// [SnackbarStatus.OPEN] Snack is fully open, [SnackbarStatus.CLOSED] Snackbar
/// has closed,
/// [SnackbarStatus.OPENING] Starts with the opening animation and ends
/// with the full
/// snackbar display, [SnackbarStatus.CLOSING] Starts with the closing animation
/// and ends
/// with the full snackbar dispose
enum SnackbarStatus { open, closed, opening, closing }

/// Indicates if snack is going to start at the [TOP] or at the [BOTTOM]
enum SnackPosition { top, bottom }

/// Indicates if snack will be attached to the edge of the screen or not
enum SnackStyle { floating, grounded }
