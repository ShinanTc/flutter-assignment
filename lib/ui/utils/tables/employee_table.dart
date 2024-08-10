import 'package:flutter/material.dart';
import 'package:my_app/services/employee/http_delete_employee_data.dart';
import 'package:my_app/ui/modals/create_edit_employee_modal.dart';
import 'package:my_app/ui/utils/tables/department_table.dart';
import '../../../services/employee/http_get_employee_data.dart';

class EmployeeTable extends StatefulWidget {
  final GlobalKey<DepartmentTableState>? departmentTableKey;
  const EmployeeTable({super.key, this.departmentTableKey});

  @override
  EmployeeTableState createState() => EmployeeTableState();
}

class EmployeeTableState extends State<EmployeeTable> {
  late Future<List<dynamic>> _employee;
  final ApiEmployeeService apiEmployeeService = ApiEmployeeService();
  final ApiEmployeeDeleteService apiDeleteService = ApiEmployeeDeleteService();
  late GlobalKey<EmployeeTableState> _employeeTableKey;

  @override
  void initState() {
    super.initState();
    fetchEmployees();
    _loadEmployees();
    _employeeTableKey = GlobalKey<EmployeeTableState>();
  }

  void _refreshEmployeeTable() {
    _employeeTableKey.currentState?.fetchEmployees();
  }

  void fetchEmployees() {
    setState(() {
      _employee = apiEmployeeService.fetchEmployees();
    });
  }

  void _loadEmployees() {
    setState(() {
      _employee = apiEmployeeService.fetchEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _employee,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No employee found.'));
        } else {
          final employee = snapshot.data!;
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
                            child: Text("Department",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold)))),
                    TableCell(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Date of Birth",
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
              ...employee.map((employee) {
                return TableRow(
                    decoration: const BoxDecoration(color: Colors.white),
                    children: [
                      TableCell(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(employee['id'].toString()))),
                      TableCell(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(employee['name']))),
                      TableCell(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(employee['department_rel']['name']))),
                      TableCell(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text((employee['dob']).toString()))),
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
                                            return CreateEditEmployeeModal(
                                              onSave: _refreshEmployeeTable,
                                              employeeId: employee['id'],
                                              employeeName: employee['name'],
                                              department:
                                                  employee['department_rel']
                                                      ['name'],
                                              dob: employee['dob'],
                                              onUpdate: _loadEmployees,
                                            );
                                          },
                                        );
                                      },
                                      child: const Text("Edit")),
                                  const Text("|"),
                                  TextButton(
                                      onPressed: () {
                                        var employeeId = employee['id'];
                                        apiDeleteService
                                            .sendDeleteRequest(employeeId)
                                            .then((_) {
                                          _loadEmployees();
                                          widget
                                              .departmentTableKey?.currentState
                                              ?.fetchDepartments();
                                        });
                                      },
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
