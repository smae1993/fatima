import 'package:fatima/fatima.dart';
import 'package:fatima/ui/buttons/fatima_button_type.dart';
import 'package:fatima/ui/buttons/src/styles/filled_button_style.dart';
import 'package:fatima/ui/buttons/src/styles/outline_button_style.dart';
import 'package:fatima/ui/buttons/src/styles/text_button_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends ButtonStyleButton {
  const Button({
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
    required super.child,
  });

  final ButtonType? type;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    switch (type) {
      case ButtonType.filled:
        return FilledButtonStyle().style;
      case ButtonType.text:
        return TextButtonStyle().style;
      case ButtonType.outlined:
        return OutlinedButtonStyle().style;
      default:
        return FilledButtonStyle().style;
    }
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
}
