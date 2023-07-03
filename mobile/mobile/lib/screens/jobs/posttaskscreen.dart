//ignore_for_file: prefer_const_constructors

import 'package:akalimu/data/models/category.dart';
import 'package:akalimu/data/models/job.dart';
import 'package:akalimu/data/providers/app_provider.dart';
import 'package:akalimu/screens/jobs/job_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostTaskPage extends StatefulWidget {
  const PostTaskPage({super.key});

  @override
  State<PostTaskPage> createState() => _PostTaskPageState();
}

class _PostTaskPageState extends State<PostTaskPage> {
  Category? categoryValue;
  String? locationValue;
  bool isRemote = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AppProvider appProvider =
          Provider.of<AppProvider>(context, listen: false);
      await appProvider.fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEBEB),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFEEEBEB),
          child: Center(
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Consumer<AppProvider>(
                  builder: (context, appProvider, _) {
                    List<Category> categories = appProvider.categories;

                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: _titleController,
                            decoration: const InputDecoration(
                              hintText: 'Enter title',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFF163a96)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter title';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Category',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          DropdownButtonFormField<Category>(
                            decoration: const InputDecoration(
                              labelText: 'Category',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFF163a96)),
                              ),
                            ),
                            value: categoryValue,
                            onChanged: (newValue) {
                              setState(() {
                                categoryValue = newValue;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select category';
                              }
                              return null;
                            },
                            items: categories
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                              hintText: 'Enter description',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFF163a96)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter description';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Location',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: _locationController,
                            decoration: const InputDecoration(
                              hintText: 'Enter location',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFF163a96)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter location';
                              }
                              return null;
                            },
                          ),
                          // DropdownButtonFormField<String>(
                          //   decoration: const InputDecoration(
                          //     labelText: 'location',
                          //     border: OutlineInputBorder(),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide:
                          //           BorderSide(width: 3, color: Color(0xFF163a96)),
                          //     ),
                          //   ),
                          //   value: locationValue,
                          //   onChanged: (newValue) {
                          //     setState(() {
                          //       locationValue = newValue;
                          //     });
                          //   },
                          //   items: const [
                          //     DropdownMenuItem(
                          //       value: 'Kampala',
                          //       child: Text('Kampala'),
                          //     ),
                          //     DropdownMenuItem(
                          //       value: 'Bukoto',
                          //       child: Text('Bukoto'),
                          //     ),
                          //     DropdownMenuItem(
                          //       value: 'Wakiso',
                          //       child: Text('Wakiso'),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Salary',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: _salaryController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Enter salary in UGX',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFF163a96)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          // Row(
                          //   children: [
                          //     const Text(
                          //       'Can this task be done remotely?',
                          //       style: TextStyle(
                          //         fontSize: 16.0,
                          //       ),
                          //     ),
                          //     const Spacer(),
                          //     Expanded(
                          //       child: Switch(
                          //         activeColor: const Color(0xFF163a96),
                          //         value: isRemote,
                          //         onChanged: (value) {
                          //           setState(() {
                          //             isRemote = value;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 20.0),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                    0xFF163a96), // Text Color background color)
                              ),
                              onPressed: () {
                                submitJob();
                              },
                              child: const Text('Continue'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  submitJob() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      Job job = Job(
        title: _titleController.text,
        categories: categoryValue != null ? [categoryValue!] : [],
        description: _descriptionController.text,
        location: _locationController.text,
        wage: int.parse(_salaryController.text),
        createdAt: DateTime.now(),
        postedBy: appProvider.userData?.id ?? 1,
      );

      appProvider.createJob(job).then((value) {
        if (value.id != null) {
          _formKey.currentState!.reset();
          Navigator.of(context)
              .pushNamed(JobDetailsScreen.routeName, arguments: value.id);
        }
      });
    }
  }
}
