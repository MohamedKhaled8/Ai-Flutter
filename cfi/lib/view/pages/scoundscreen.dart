import 'package:cfi/logic/controller/maincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class secoundScreen extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          centerTitle: true,
          title: const Text(
            'Ai App Flutter',
            style: TextStyle(
                fontSize: 17, color: Colors.white, letterSpacing: 0.53),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Icon(
                  Icons.notifications,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const  EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          controller.getImage();
                        },
                        child: const Text("Pick File")),
                    GetBuilder<HomeController>(
                        init: HomeController(),
                        builder: ((controller) {
                          return Center(
                            child: controller.imageBefore == null
                                ? const Text('Please pick your image')
                                : Image.file(controller.imageBefore),
                          );
                        })),
                    ElevatedButton(
                        onPressed: () {
                          controller.uploadeImage(controller.imageBefore);
                        },
                        child: const Text("Uploade File")),
                    GetBuilder<HomeController>(
                      
                      builder: ((controller) {
                        return Center(
                            child: controller.imageAfter == null
                                ? const CircularProgressIndicator()
                                : Image.memory(controller.imageAfter));
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
