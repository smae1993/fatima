import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilledButtonStyle {
  Size? fixedSize;
  BorderSide? side;
  FilledButtonStyle(
    this.context, {
    this.radius = 15,
    this.fixedSize,
    this.side,
  }) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final Color? background = colorScheme.primary;
    final Color? disabledBackground = colorScheme.onSurface.withOpacity(0.12);
    final MaterialStateProperty<Color?>? backgroundColorProp =
        (background == null && disabledBackground == null)
            ? null
            : _ButtonDefaultColor(background, disabledBackground);
    final Color? foreground = colorScheme.onPrimary;
    final Color? disabledForeground = colorScheme.onSurface.withOpacity(0.38);
    final MaterialStateProperty<Color?>? foregroundColorProp =
        (foreground == null && disabledForeground == null)
            ? null
            : _ButtonDefaultColor(foreground, disabledForeground);
    final MaterialStateProperty<Color?>? overlayColor =
        (foreground == null) ? null : _ButtonDefaultOverlay(foreground);
    final MaterialStateProperty<double>? elevationValue =
        (2 == null) ? null : _ButtonDefaultElevation(2);
    final MaterialStateProperty<MouseCursor?>? mouseCursor =
        (SystemMouseCursors.click == null && SystemMouseCursors.basic == null)
            ? null
            : _ButtonDefaultMouseCursor(
                SystemMouseCursors.click, SystemMouseCursors.basic);

    style = ButtonStyle(
      textStyle: MaterialStatePropertyAll<TextStyle?>(theme.textTheme.button),
      backgroundColor: backgroundColorProp,
      foregroundColor: foregroundColorProp,
      overlayColor: overlayColor,
      shadowColor: ButtonStyleButton.allOrNull<Color>(theme.shadowColor),
      // surfaceTintColor: ButtonStyleButton.allOrNull<Color>(surfaceTintColor),
      elevation: elevationValue,
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
          _scaledPadding(context)),
      minimumSize: ButtonStyleButton.allOrNull<Size>(const Size(64, 36)),
      fixedSize: ButtonStyleButton.allOrNull<Size>(fixedSize),
      maximumSize: ButtonStyleButton.allOrNull<Size>(Size.infinite),
      side: ButtonStyleButton.allOrNull<BorderSide>(side),
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)))),
      mouseCursor: mouseCursor,
      visualDensity: theme.visualDensity,
      tapTargetSize: theme.materialTapTargetSize,
      animationDuration: kThemeChangeDuration,
      enableFeedback: true,
      alignment: Alignment.center,
      splashFactory: InkRipple.splashFactory,
    );
  }

  BuildContext context;
  late ButtonStyle style;

  double? radius;
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
