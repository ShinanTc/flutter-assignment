import 'package:flutter/material.dart';

class CreateEditDepartmentModal extends StatelessWidget {
  const CreateEditDepartmentModal({super.key});

  @override
  Widget build(BuildContext context) {
    // for getting the screen height (used for making the modal to take majority of the screen height)
    final screenHeight = (MediaQuery.of(context).size.height) - 100;

    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Create / Edit Department',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle save button click
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
