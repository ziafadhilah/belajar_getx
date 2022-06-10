// ignore_for_file: prefer_const_constructors, avoid_print
import 'dart:convert';
import 'package:belajar_getx/model/dashboard_model.dart';
import 'package:belajar_getx/services/http_services.dart';
import 'package:belajar_getx/views/edit.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxBool isLoading = true.obs;
  late Map<String, dynamic> body;
  RxList<Dashboard> notes = <Dashboard>[].obs;

  // var notes = List<Dashboard>.empty().obs;

  TextEditingController addTitleController = TextEditingController();
  TextEditingController addDescriptionController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxInt id = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboard();
  }

  void fetchDashboard() async {
    Request request = Request(url: '/');
    request.get().then((value) {
      if (value.statusCode == 200) {
        List jsonResponse = jsonDecode(value.body);
        notes.value = jsonResponse.map((e) => Dashboard.fromJson(e)).toList();
        // print(notes.map((e) => e.title));
      } else {
        print('Backend error');
      }
    });
  }

  void addNotes() async {
    Request request = Request(url: '/', body: {
      'title': addTitleController.text,
      'description': addDescriptionController.text,
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 200) {
        print(body["message"]);
        fetchDashboard();
        titleController.clear();
        descriptionController.clear();
        return Get.back();
      } else {
        print('Backend error');
        // return Get.back();
      }
    });
  }

  void editNotes(int id) async {
    try {
      Request request = Request(url: '/$id', body: {
        'title': titleController.text,
        'description': descriptionController.text,
      });
      request.patch().then((value) {
        body = jsonDecode(value.body);
        if (value.statusCode == 200) {
          print(body["message"]);
          fetchDashboard();
          titleController.clear();
          descriptionController.clear();
          return Get.back();
        } else {
          print(body);
          // return Get.back();
        }
      });
    } catch (e) {
      print("error ${e}");
    }
  }

  void delete(int id) async {
    try {
      Request request = Request(url: '/$id', body: {
        'id': id.toString(),
      });
      request.delete().then((value) {
        body = jsonDecode(value.body);
        if (value.statusCode == 200) {
          print(body["message"]);
          fetchDashboard();
          titleController.clear();
          descriptionController.clear();
          return Get.back();
        } else {
          print(body);
          // return Get.back();
        }
      });
    } catch (e) {
      print("error ${e}");
    }
  }
}
