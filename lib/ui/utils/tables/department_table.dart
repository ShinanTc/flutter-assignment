import 'package:flutter/material.dart';
import '../../../services/http_get_department_data.dart';

class DepartmentTable extends StatefulWidget {
  const DepartmentTable({super.key});

  @override
  State<DepartmentTable> createState() => _DepartmentTableState();
}

class _DepartmentTableState extends State<DepartmentTable> {
  late Future<List<dynamic>> _departments;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _departments = apiService.fetchDepartments();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _departments,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No departments found.'));
        } else {
          final departments = snapshot.data!;
          return Table(
            border: TableBorder.all(
                color: const Color.fromARGB(255, 190, 186, 186)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            defaultColumnWidth: const IntrinsicColumnWidth(),
            children: [
              // TABLE HEADING
              const TableRow(
                  decoration: BoxDecoration(color: Colors.white),
                  children: [
                    TableCell(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("ID",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold)))),
                    TableCell(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Name",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold)))),
                    TableCell(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Number of Employees",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold)))),
                    TableCell(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Actions",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold)))),
                  ]),
              // TABLE VALUES
              ...departments.map((department) {
                return TableRow(
                    decoration: const BoxDecoration(color: Colors.white),
                    children: [
                      TableCell(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(department['id'].toString()))),
                      TableCell(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(department['name']))),
                      TableCell(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  department['numberofemployees'].toString()))),
                      const TableCell(
                          child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Actions'))),
                    ]);
              }),
            ],
          );
        }
      },
    );
  }
}
