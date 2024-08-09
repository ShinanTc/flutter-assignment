import 'package:flutter/material.dart';
import '../../ui/utils/custom_button.dart';
import '../../values/values.dart';
import '../utils/tables/department_table.dart';
import '../utils/tables/employee_table.dart';
import '../modals/create_edit_department_modal.dart';
import '../modals/create_edit_employee_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late GlobalKey<DepartmentTableState> _departmentTableKey;
  late GlobalKey<EmployeeTableState> _employeeTableKey;

  @override
  void initState() {
    super.initState();
    _departmentTableKey = GlobalKey<DepartmentTableState>();
    _employeeTableKey = GlobalKey<EmployeeTableState>();
  }

  void _refreshDepartmentTable() {
    _departmentTableKey.currentState?.fetchDepartments();
  }

  void _refreshEmployeeTable() {
    _employeeTableKey.currentState?.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: buttonPadding,
              child: CustomButton(
                text: 'Create New Department',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    builder: (BuildContext context) {
                      return CreateEditDepartmentModal(
                        onSave: _refreshDepartmentTable,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: tablePadding,
              child: DepartmentTable(key: _departmentTableKey),
            ),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: buttonPadding,
              child: CustomButton(
                text: 'Add New Employee',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    builder: (BuildContext context) {
                      return CreateEditEmployeeModal(
                          onSave: _refreshEmployeeTable);
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: tablePadding, child: EmployeeTable()),
          ),
        ],
      ),
    );
  }
}
