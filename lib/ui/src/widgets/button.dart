import 'package:fatima/fatima.dart';
import 'package:fatima/ui/buttons/src/styles/filled_button_style.dart';
import 'package:fatima/ui/buttons/src/styles/outline_button_style.dart';
import 'package:fatima/ui/buttons/src/styles/text_button_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends ButtonStyleButton {
  Size? fixedSize;
  BorderSide? side;
  TextStyle? textStyle;
  Color? backgroundColor;
  Color? hoverBackgroundColor;
  Color? foregroundColor;
  Color? hoverForegroundColor;
  Color? overlayColor;
  Color? shadowColor;
  Color? surfaceTintColor;
  double? elevation;
  EdgeInsetsGeometry? padding;
  Size? minimumSize;
  Size? maximumSize;
  OutlinedBorder? shape;
  MouseCursor? mouseCursor;
  VisualDensity? visualDensity;
  MaterialTapTargetSize? tapTargetSize;
  Duration? animationDuration;
  bool? enableFeedback;
  AlignmentGeometry? alignment;
  InteractiveInkFeatureFactory? splashFactory;

  Color? disabledBackgroundColor;
  Color? disabledForegroundColor;

  bool square;
  double? radius;

  Button({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    this.type,

    /// Style

    this.square = false,
    this.radius = 15,
    this.fixedSize,
    this.side,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.padding,
    this.minimumSize,
    this.maximumSize,
    this.shape,
    this.mouseCursor,
    this.visualDensity,
    this.tapTargetSize,
    this.animationDuration,
    this.enableFeedback,
    this.alignment,
    this.splashFactory,

    /// end Style
    required super.child,
  });

  final ButtonType? type;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return _initializeStyle(context);
    // switch (type) {
    //   case ButtonType.filled:
    //     return FilledButtonStyle().style;
    //   case ButtonType.text:
    //     return TextButtonStyle().style;
    //   case ButtonType.outlined:
    //     return OutlinedButtonStyle().style;
    //   default:
    //     return FilledButtonStyle().style;
    // }
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    switch (type) {
      case ButtonType.filled:
        return ElevatedButtonTheme.of(context).style;
      case ButtonType.text:
        return TextButtonTheme.of(context).style;
      case ButtonType.outlined:
        return OutlinedButtonTheme.of(context).style;
      default:
        return ElevatedButtonTheme.of(context).style;
    }
  }

  factory Button.text({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    TextButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    MaterialStatesController? statesController,
    required Widget child,
  }) =>
      Button(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style?.style,
        focusNode: focusNode,
        autofocus: autofocus = false,
        clipBehavior: clipBehavior = Clip.none,
        statesController: statesController,
        type: ButtonType.text,
        child: child,
      );

  factory Button.filled({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    FilledButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    MaterialStatesController? statesController,
    required Widget child,
  }) =>
      Button(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style?.style,
        focusNode: focusNode,
        autofocus: autofocus = false,
        clipBehavior: clipBehavior = Clip.none,
        statesController: statesController,
        type: ButtonType.outlined,
        child: child,
      );

  factory Button.outlined({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    OutlinedButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    MaterialStatesController? statesController,
    required Widget child,
  }) =>
      Button(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style?.style,
        focusNode: focusNode,
        autofocus: autofocus = false,
        clipBehavior: clipBehavior = Clip.none,
        statesController: statesController,
        type: ButtonType.outlined,
        child: child,
      );

  factory Button.icon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    OutlinedButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    MaterialStatesController? statesController,
    required Widget child,
  }) =>
      Button(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style?.style,
        focusNode: focusNode,
        autofocus: autofocus = false,
        clipBehavior: clipBehavior = Clip.none,
        statesController: statesController,
        type: ButtonType.outlined,
        child: child,
      );

  ButtonStyle _initializeStyle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    /// Background Color
    backgroundColor = backgroundColor ?? colorScheme.primary;
    disabledBackgroundColor = backgroundColor != null
        ? backgroundColor!.withOpacity(0.12)
        : colorScheme.onSurface.withOpacity(0.12);

    if (type == ButtonType.text) {
      foregroundColor = foregroundColor ?? colorScheme.onBackground;
    } else {
      foregroundColor = foregroundColor ?? colorScheme.onPrimary;
    }

    if (type == ButtonType.outlined || type == ButtonType.text) {
      backgroundColor = Colors.transparent;
      shadowColor = Colors.transparent;
      if (type == ButtonType.outlined) {
        side = BorderSide(width: 1, color: foregroundColor!);
      }
    } else {}

    disabledForegroundColor = foregroundColor != null
        ? foregroundColor!.withOpacity(0.38)
        : colorScheme.onSurface.withOpacity(0.38);

    textStyle = textStyle ?? theme.textTheme.button;
    shadowColor = shadowColor ?? theme.shadowColor;

    visualDensity = visualDensity ?? theme.visualDensity;
    tapTargetSize = tapTargetSize ?? theme.materialTapTargetSize;
    animationDuration = animationDuration ?? kThemeChangeDuration;

    /// Background Color
    final MaterialStateProperty<Color?> backgroundColorProp =
        _ButtonDefaultColor(backgroundColor, disabledBackgroundColor);

    /// Foreground Color
    final MaterialStateProperty<Color?> foregroundColorProp =
        _ButtonDefaultColor(foregroundColor, disabledForegroundColor);

    /// Overlay Color
    final MaterialStateProperty<Color?> overlayColor =
        _ButtonDefaultOverlay(foregroundColor!);

    /// Elevation
    final MaterialStateProperty<double> elevationValue =
        _ButtonDefaultElevation(elevation ?? 2);

    /// Mouse Cursor
    final MaterialStateProperty<MouseCursor?> cursor =
        _ButtonDefaultMouseCursor(
            mouseCursor ?? SystemMouseCursors.click, SystemMouseCursors.basic);

    return ButtonStyle(
      textStyle: MaterialStatePropertyAll<TextStyle?>(textStyle),
      backgroundColor: backgroundColorProp,
      foregroundColor: foregroundColorProp,
      overlayColor: overlayColor,
      shadowColor: ButtonStyleButton.allOrNull<Color>(shadowColor),
      // surfaceTintColor: ButtonStyleButton.allOrNull<Color>(surfaceTintColor),
      elevation: elevationValue,
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
          padding ?? _scaledPadding(Fatima.context!)),
      minimumSize:
          ButtonStyleButton.allOrNull<Size>(minimumSize ?? const Size(64, 36)),
      fixedSize: ButtonStyleButton.allOrNull<Size>(fixedSize),
      maximumSize:
          ButtonStyleButton.allOrNull<Size>(maximumSize ?? Size.infinite),
      side: ButtonStyleButton.allOrNull<BorderSide>(side),
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(shape ??
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      mouseCursor: cursor,
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback ?? true,
      alignment: alignment ?? Alignment.center,
      splashFactory: splashFactory ?? InkRipple.splashFactory,
    );
  }
}

EdgeInsetsGeometry _scaledPadding(BuildContext context) {
  return ButtonStyleButton.scaledPadding(
    const EdgeInsets.symmetric(horizontal: 16),
    const EdgeInsets.symmetric(horizontal: 8),
    const EdgeInsets.symmetric(horizontal: 4),
    MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
  );
}

@immutable
class _ButtonDefaultColor extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _ButtonDefaultColor(this.color, this.disabled);

  final Color? color;
  final Color? disabled;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return color;
  }
}

@immutable
class _ButtonDefaultOverlay extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _ButtonDefaultOverlay(this.overlay);

  final Color overlay;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return overlay.withOpacity(0.08);
    }
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.pressed)) {
      return overlay.withOpacity(0.24);
    }
    return null;
  }
}

@immutable
class _ButtonDefaultElevation extends MaterialStateProperty<double>
    with Diagnosticable {
  _ButtonDefaultElevation(this.elevation);

  final double elevation;

  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return 0;
    }
    if (states.contains(MaterialState.hovered)) {
      return elevation + 2;
    }
    if (states.contains(MaterialState.focused)) {
      return elevation + 2;
    }
    if (states.contains(MaterialState.pressed)) {
      return elevation + 6;
    }
    return elevation;
  }
}

@immutable
class _ButtonDefaultMouseCursor extends MaterialStateProperty<MouseCursor?>
    with Diagnosticable {
  _ButtonDefaultMouseCursor(this.enabledCursor, this.disabledCursor);

  final MouseCursor? enabledCursor;
  final MouseCursor? disabledCursor;

  @override
  MouseCursor? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabledCursor;
    }
    return enabledCursor;
  }
}

/// Button Types
enum ButtonType { filled, text, outlined }

class ButtonConfig extends ButtonStyle {
  const ButtonConfig({
    this.borderColor,
    this.disabledBorderColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.square = false,
    this.radius = 15,
    this.type,
    super.alignment,
    super.animationDuration,
    super.backgroundColor,
    super.elevation,
    super.enableFeedback,
    super.fixedSize,
    super.foregroundColor,
    super.maximumSize,
    super.minimumSize,
    super.mouseCursor,
    super.overlayColor,
    super.padding,
    super.shadowColor,
    super.shape,
    super.side,
    super.splashFactory,
    super.surfaceTintColor,
    super.tapTargetSize,
    super.textStyle,
    super.visualDensity,
  }) : super();

  final Color? borderColor;

  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? disabledBorderColor;

  final bool square;
  final double? radius;

  final ButtonType? type;
}
