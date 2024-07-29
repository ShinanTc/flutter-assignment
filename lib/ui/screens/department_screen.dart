import 'package:flutter/material.dart';
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
            // const SizedBox(height: 16),
            // DataTable(
            //   columns: const [
            //     DataColumn(label: Text('ID')),
            //     DataColumn(label: Text('Name')),
            //     DataColumn(label: Text('Number of Employees')),
            //     DataColumn(label: Text('Actions')),
            //   ],
            //   rows: [
            //     // TODO: Populate with department data
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
