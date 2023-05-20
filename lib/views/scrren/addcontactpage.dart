import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practical_2/utils/MyGloballist.dart';
import 'package:practical_2/utils/MyGloballist.dart';
import '../../modals/Globals.dart';
import '../components/mysnackbar.dart';
// import '';

class add_contact extends StatefulWidget {
  const add_contact({Key? key}) : super(key: key);

  @override
  State<add_contact> createState() => _add_contactState();
}

class _add_contactState extends State<add_contact> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  File? image;
  String? name;
  String? contact;
  String? email;
  String? website;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADD_CONTACT_PAGE",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();

                ScaffoldMessenger.of(context).showSnackBar(
                  mySnackBar(
                    text: "Successfully save contact!!",
                    color: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  mySnackBar(
                    text: "Failed to save contact!!",
                    color: Colors.red,
                  ),
                );
              }
              Globals.allContacts.add(
                Contact(
                  name: name!,
                  contact: contact!,
                  image: image!,
                  email: email,
                  website: website,
                ),
              );
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.check,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        foregroundImage:
                        (image != null) ? FileImage(image!) : null,
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.grey.shade300,
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: FloatingActionButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Select the method !!"),
                                actions: [
                                  TextButton.icon(
                                    onPressed: () async {
                                      Navigator.of(context).pop();

                                      XFile? file = await picker.pickImage(
                                          source: ImageSource.camera);

                                      if (file != null) {
                                        setState(() {
                                          image = File(file.path);
                                        });
                                      }
                                    },
                                    label: const Text("Camera"),
                                    icon: const Icon(Icons.camera_alt),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextButton.icon(
                                    onPressed: () async {
                                      XFile? file = await picker.pickImage(
                                          source: ImageSource.gallery);

                                      if (file != null) {
                                        setState(() {
                                          image = File(file.path);
                                        });
                                      }

                                      Navigator.of(context).pop();
                                    },
                                    label: const Text("Gallery"),
                                    icon: const Icon(Icons.image),
                                  ),
                                ],
                              ),
                            );
                          },
                          mini: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter First name!!";
                    } else {
                      return null;
                    }
                  },
                  initialValue: name,
                  onSaved: (val) {
                    name = val!;
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter email id!!";
                    } else {
                      return null;
                    }
                  },
                  initialValue: email,
                  onSaved: (val) {
                    email = val!;
                  },
                  decoration: InputDecoration(
                    hintText: "email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Contact",
                    style: TextStyle(fontSize: 20), textAlign: TextAlign.start),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter contact!!";
                    } else {
                      return null;
                    }
                  },
                  initialValue: contact,
                  onSaved: (val) {
                    contact = val!;
                  },
                  decoration: InputDecoration(
                    prefixText: '+91 ',
                    hintText: "Contact",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("website",
                    style: TextStyle(fontSize: 20), textAlign: TextAlign.start),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter website!!";
                    } else {
                      return null;
                    }
                  },
                  initialValue: website,
                  onSaved: (val) {
                    website = val!;
                  },
                  decoration: InputDecoration(
                    hintText: "website",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}