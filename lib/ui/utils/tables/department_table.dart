import 'package:flutter/material.dart';
import 'package:my_app/ui/modals/create_edit_department_modal.dart';
import '../../../services/http_get_department_data.dart';

class DepartmentTable extends StatefulWidget {
  const DepartmentTable({super.key});

  @override
  DepartmentTableState createState() => DepartmentTableState();
}

class DepartmentTableState extends State<DepartmentTable> {
  late Future<List<dynamic>> _departments;
  final ApiService apiService = ApiService();
  late GlobalKey<DepartmentTableState> _departmentTableKey;

  @override
  void initState() {
    super.initState();
    fetchDepartments();
    _departmentTableKey = GlobalKey<DepartmentTableState>();
  }

  void _refreshDepartmentTable() {
    _departmentTableKey.currentState?.fetchDepartments();
  }

  void fetchDepartments() {
    setState(() {
      _departments = apiService.fetchDepartments();
    });
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
                              child: Text((department['numberofemployees'] ?? 0)
                                  .toString()))),
                      TableCell(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          builder: (BuildContext context) {
                                            return CreateEditDepartmentModal(
                                              onSave: _refreshDepartmentTable,
                                              departmentId: department['id'],
                                              departmentName:
                                                  department['name'],
                                            );
                                          },
                                        );
                                      },
                                      child: const Text("Edit")),
                                  const Text("|"),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text("Delete"))
                                ],
                              ))),
                    ]);
              }),
            ],
          );
        }
      },
    );
  }
}
