import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData? icon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const InputField({
    super.key,
    required this.label,
    required this.controller,
    this.icon,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}