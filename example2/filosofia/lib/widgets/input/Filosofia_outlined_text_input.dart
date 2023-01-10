import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/filosofia_theme.dart';

class FilosofiaTextFormField extends StatelessWidget {
  final String? labelText;
  final double? height;
  final bool? filled;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool autocorrect;
  final bool obscure;
  final Icon? suffix;
  final Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final bool? enabled;

  const FilosofiaTextFormField({
    super.key,
    this.labelText,
    this.height,
    this.filled,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.autocorrect = false,
    this.obscure = false,
    this.suffix,
    this.onChanged,
    this.onEditingComplete,
    this.keyboardType,
    this.focusNode,
    this.onTap,
    this.onSaved,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
            width: 10.0,
          ),
        ),
        suffixIcon: suffix,
        labelText: labelText,
      ),
      obscureText: obscure,
      autocorrect: autocorrect,
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      keyboardType: keyboardType,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      onTap: onTap,
      onSaved: onSaved,
      enabled: enabled,
    );
  }
}
