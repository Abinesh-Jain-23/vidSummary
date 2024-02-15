import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vid_summary/pages/home_page/home_page.controller.dart';

class HomePageView extends GetResponsiveView<HomePageController> {
  HomePageView({super.key});
  @override
  Widget? builder() {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Welcome to VidSummary',
              textAlign: TextAlign.center,
            ),
            Obx(
              () => Column(
                children: [
                  Form(
                    key: controller.form,
                    child: TextFormField(
                      controller: controller.textEditingController,
                      keyboardType: TextInputType.url,
                      validator: controller.validateField,
                      onChanged: (value) => controller.url.value = value,
                      decoration: InputDecoration(
                        suffixIcon: controller.url.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  controller.textEditingController.clear();
                                  controller.url.value = '';
                                },
                                icon: const Icon(Icons.clear),
                              )
                            : null,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: controller.generateVideoSummaryPressed,
                    child: const Text('Play'),
                  ),
                  controller.loading.value
                      ? const CircularProgressIndicator.adaptive()
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            const Text(
              "Let's gets started",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
