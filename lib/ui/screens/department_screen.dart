import 'package:flutter/material.dart';

import '../../ui/utils/custom_button.dart';
import '../../values/padding.dart';

import '../utils/tables/department_table.dart';
import '../utils/tables/employee_table.dart';

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: buttonPadding,
              child: CustomButton(text: 'Create New Department'),
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: tablePadding, child: DepartmentTable()),
          ),
          SizedBox(height: 32),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: buttonPadding,
              child: CustomButton(text: 'Add New Employee'),
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: tablePadding, child: EmployeeTable()),
          ),
        ],
      ),
    );
  }
}
