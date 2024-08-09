import 'package:flutter/material.dart';
import 'package:my_app/services/employee/http_edit_employee_data.dart';
import '../utils/custom_button.dart';
import '../../services/employee/http_create_employee_data.dart';

class CreateEditEmployeeModal extends StatefulWidget {
  final VoidCallback onSave;
  final int? employeeId;
  final String? employeeName;
  final VoidCallback? onUpdate;

  const CreateEditEmployeeModal(
      {required this.onSave,
      super.key,
      this.employeeId,
      this.employeeName,
      this.onUpdate});

  @override
  State<CreateEditEmployeeModal> createState() =>
      _CreateEditEmployeeModalState();
}

class _CreateEditEmployeeModalState extends State<CreateEditEmployeeModal> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // if (widget.employeeName != null) {
    //   _employeeController.text = widget.employeeName!;
    // }
  }

  @override
  Widget build(BuildContext context) {
    final apiEmployeeService = ApiEmployeeService();
    final apiEmployeePatchService = ApiEmployeePatchService();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              "Create / Edit Employee",
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Container(
              width: 400,
              height: 550,
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromARGB(255, 244, 241, 241),
                  borderRadius: BorderRadius.zero,
                  border: Border(
                      top:
                          BorderSide(color: Color.fromARGB(255, 189, 183, 183)),
                      left: BorderSide(
                          color: Color.fromARGB(255, 189, 183, 183)))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 60, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create / Edit Employee",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 330,
                      height: 40,
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Department",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 330,
                      height: 40,
                      child: TextField(
                        controller: _departmentController,
                        decoration: InputDecoration(
                          hintText: 'Department',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Date of Birth",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 330,
                      height: 40,
                      child: TextField(
                        controller: _dobController,
                        decoration: InputDecoration(
                          hintText: 'Date of Birth',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                        width: 330,
                        height: 40,
                        child: CustomButton(
                          text: 'Save',
                          onPressed: () {
                            // if (widget.employeeId != null &&
                            //     widget.employeeName != null) {
                            //   var employeeName = _employeeController.text;
                            //   var employeeId = widget.employeeId;

                            //   apiEmployeePatchService
                            //       .sendPatchRequest(employeeName, employeeId!)
                            //       .then((_) {
                            //     widget.onSave();

                            //     if (widget.onUpdate != null) {
                            //       widget.onUpdate!();
                            //     }
                            Navigator.pop(context);
                            // });
                            // } else {
                            // var employeeName = _employeeController.text;
                            // apiEmployeeService
                            //     .sendPostRequest(employeeName)
                            //     .then((_) {
                            //   widget.onSave();
                            //   Navigator.pop(context);
                            // });
                            // }
                          },
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
