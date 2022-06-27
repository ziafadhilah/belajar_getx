// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:belajar_getx/controller/dashboard_controller.dart';
import 'package:belajar_getx/views/edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final DashboardController notesC = Get.put(DashboardController());

  Future<void> _onEdit(int id, String title, String description) async {
    Get.to(Edit(
      title: title,
      description: description,
    ));
  }

  Future<void> _onDelete(int id) async {
    notesC.delete(id);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotesX'),
        actions: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Jumlah Data : ${notesC.notes.length}'),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (notesC.isLoading.value) {
                  return ListView.builder(
                    itemCount: notesC.notes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text(notesC.notes[index].title),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () => _onEdit(
                                        notesC.notes[index].id,
                                        notesC.notes[index].title,
                                        notesC.notes[index].description),
                                    child: Icon(Icons.edit),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _onDelete(notesC.notes[index].id);
                                    },
                                    child: Icon(Icons.delete),
                                  ),
                                ])
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
//                       ),
//                       Text(
//                         notesC.notes[index].title,
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Description : ",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       Flexible(
//                         flex: 1,
//                         child: Text(
//                           notesC.notes[index].description,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }),
// ),
