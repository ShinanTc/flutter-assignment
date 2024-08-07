import 'package:flutter/material.dart';
import '../utils/custom_button.dart';
import '../../services/http_create_department_data.dart';

class CreateEditDepartmentModal extends StatefulWidget {
  final VoidCallback onSave;

  const CreateEditDepartmentModal({required this.onSave, super.key});

  @override
  State<CreateEditDepartmentModal> createState() =>
      _CreateEditDepartmentModalState();
}

class _CreateEditDepartmentModalState extends State<CreateEditDepartmentModal> {
  final TextEditingController _departmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              "Create / Edit Department",
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
                      "Create / Edit Department",
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
                        controller: _departmentController,
                        decoration: InputDecoration(
                          hintText: 'Name',
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
                            var departmentName = _departmentController.text;
                            apiService
                                .sendPostRequest(departmentName)
                                .then((_) {
                              widget.onSave();
                              Navigator.pop(context);
                            });
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
