import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimeFieldItem extends StatelessWidget {
  const TimeFieldItem({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 44,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onTap: () {
          final text = controller.text;
          controller.value = controller.value.copyWith(
            selection: TextSelection.collapsed(offset: text.length),
          );
        },
      ),
    );
  }
}
