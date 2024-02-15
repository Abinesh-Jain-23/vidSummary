import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

mixin HomePageVariables {
  final TextEditingController textEditingController = TextEditingController();
  RxString url = ''.obs;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  RxBool loading = false.obs;
}
