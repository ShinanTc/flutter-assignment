import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../values/colors.dart';

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Implement create new department logic
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              child: const Text(
                'Create New Department',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.black, // Adjust color as needed
              ),
              child: DataTable(columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Number of Employees')),
                DataColumn(label: Text('Actions')),
              ], rows: [
                DataRow(cells: [
                  DataCell(Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: const Padding(
                        padding: EdgeInsets.all(8.0), child: Text("1")),
                  )),
                  DataCell(Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: const Padding(
                        padding: EdgeInsets.all(8.0), child: Text("1")),
                  )),
                  DataCell(Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: const Padding(
                        padding: EdgeInsets.all(8.0), child: Text("1")),
                  )),
                  DataCell(Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: const Padding(
                        padding: EdgeInsets.all(8.0), child: Text("1")),
                  )),
                ])
              ]

                  // DataRow(cells: [
                  //   DataCell(Text("1")),
                  //   DataCell(Text("John Doe")),
                  //   DataCell(Text("10")),
                  //   DataCell(Text("This is the action")),
                  // ]),
                  // DataRow(cells: [
                  //   DataCell(Text("2")),
                  //   DataCell(Text("John Boe")),
                  //   DataCell(Text("20")),
                  //   DataCell(Text("This is not the action")),
                  // ]),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
