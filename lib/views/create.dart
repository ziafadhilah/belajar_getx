// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:belajar_getx/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Create extends StatelessWidget {
  Create({Key? key}) : super(key: key);

  final DashboardController dashboardController =
      Get.put(DashboardController());

  void _addNotes() {
    dashboardController.addNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Note'),
      ),
      body: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: dashboardController.addTitleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              style: const TextStyle(
                fontSize: 18,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Note Title is Required!';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Description',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: dashboardController.addDescriptionController,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Type Note Description Here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              style: const TextStyle(
                fontSize: 18,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Note Description is Required!';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: _addNotes,
            ),
          ],
        ),
      ),
    );
  }
}
