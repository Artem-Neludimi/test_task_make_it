import 'package:flutter/material.dart';

class NotificationControllers {
  late TabController tabController;

  init(TickerProvider vsync) {
    tabController = TabController(length: 2, vsync: vsync, animationDuration: const Duration(milliseconds: 300));
  }

  dispose() {
    tabController.dispose();
  }
}
