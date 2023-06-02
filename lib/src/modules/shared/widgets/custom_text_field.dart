import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String label;
  final bool enabled;
  final bool password;
  final bool readOnly;
  final String? initialValue;
  final IconData? icon;
  final FocusNode? focus;
  final List<TextInputFormatter> inputFormatters;
  final List<String? Function(String text)> validators;
  final void Function(String? text)? onChanged;
  final void Function(String? text)? onSave;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.label,
    this.initialValue,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.password = false,
    this.icon,
    this.focus,
    this.inputFormatters = const [],
    this.validators = const [],
    this.onChanged,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          validator: (value) {
            for (var validator in validators) {
              var validatorResult = validator.call(value!);
              if (validatorResult != null) {
                return validatorResult;
              }
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: onSave,
          initialValue: initialValue,
          onChanged: onChanged,
          enabled: enabled,
          readOnly: readOnly,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: const OutlineInputBorder(),
            prefixIcon: icon == null ? null : Icon(icon),
          ),
          focusNode: focus,
          inputFormatters: inputFormatters,
          obscureText: password,
        ),
        const Padding(padding: EdgeInsets.all(10)),
      ],
    );
  }
}
