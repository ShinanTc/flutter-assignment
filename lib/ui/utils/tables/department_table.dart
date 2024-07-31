import 'package:flutter/material.dart';

class DepartmentTable extends StatelessWidget {
  const DepartmentTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: const Color.fromARGB(255, 190, 186, 186)),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      defaultColumnWidth:
          const IntrinsicColumnWidth(), // For increasing the cell width based on the text
      children: const [
        // TABLE HEADING

        TableRow(decoration: BoxDecoration(color: Colors.white), children: [
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("ID", style: TextStyle(fontWeight: FontWeight.bold)),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Number of Employees",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Text("Actions", style: TextStyle(fontWeight: FontWeight.bold)),
          )),
        ]),

        // TABLE VALUES

        TableRow(decoration: BoxDecoration(color: Colors.white), children: [
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("1"),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Some title"),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Some title"),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Some title"),
          )),
        ])
      ],
    );
  }
}
