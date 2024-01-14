import 'package:flutter/material.dart';

class AuthControllers {
  late BuildContext globalContext;

  void init(BuildContext context) {
    globalContext = context;
  }

  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
  }

  String get formattedTimeHhMm => '${controller1.text}${controller2.text}:${controller3.text}${controller4.text}';

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();

  void onChanged1(String value) {
    if (value.isEmpty) return;
    if (value.length > 1) controller1.text = value.substring(value.length - 1);
    FocusScope.of(globalContext).requestFocus(focusNode2);
  }

  void onChanged2(String value) {
    if (value.isEmpty) return FocusScope.of(globalContext).requestFocus(focusNode1);
    if (value.length > 1) controller2.text = value.substring(value.length - 1);
    FocusScope.of(globalContext).requestFocus(focusNode3);
  }

  void onChanged3(String value) {
    if (value.isEmpty) return FocusScope.of(globalContext).requestFocus(focusNode2);
    if (value.length > 1) controller3.text = value.substring(value.length - 1);
    FocusScope.of(globalContext).requestFocus(focusNode4);
  }

  void onChanged4(String value) {
    if (value.isEmpty) return FocusScope.of(globalContext).requestFocus(focusNode3);
    if (value.length > 1) controller4.text = value.substring(value.length - 1);
    FocusScope.of(globalContext).unfocus();
  }
}
