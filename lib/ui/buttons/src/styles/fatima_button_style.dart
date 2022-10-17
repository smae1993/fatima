import 'package:fatima/fatima.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class FatimaButtonStyle {
  Size? fixedSize;
  BorderSide? side;
  late ButtonStyle style;
  TextStyle? textStyle;
  Color? backgroundColor;
  Color? foregroundColor;
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

  double? radius;
  FatimaButtonStyle({
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
  }) {
    final ThemeData theme = Theme.of(Fatima.context!);
    final ColorScheme colorScheme = theme.colorScheme;

    /// Background Color
    backgroundColor = backgroundColor ?? colorScheme.primary;
    disabledBackgroundColor = backgroundColor != null
        ? backgroundColor!.withOpacity(0.12)
        : colorScheme.onSurface.withOpacity(0.12);
    foregroundColor = foregroundColor ?? colorScheme.onPrimary;
    disabledForegroundColor = foregroundColor != null
        ? foregroundColor!.withOpacity(0.38)
        : colorScheme.onSurface.withOpacity(0.38);

    textStyle = textStyle ?? theme.textTheme.button;
    shadowColor = shadowColor ?? theme.shadowColor;

    visualDensity = visualDensity ?? theme.visualDensity;
    tapTargetSize = tapTargetSize ?? theme.materialTapTargetSize;
    animationDuration = animationDuration ?? kThemeChangeDuration;
  }

  void generateStyle() {
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

    style = ButtonStyle(
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
