import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../modals/Globals.dart';
import '../../modals/Mybackicon.dart';
import '../../utils/MyGloballist.dart';
import '../components/mysnackbar.dart';

class edit_contact extends StatefulWidget {
  const edit_contact({Key? key}) : super(key: key);

  @override
  State<edit_contact> createState() => _edit_contactState();
}

class _edit_contactState extends State<edit_contact> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  File? image;
  String? name;
  String? contact;
  String? email;
  String? website;
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.done),
          ),
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
                  email: email!,
                  image: image!,
                  website: website!,
                ),
              );
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.check,
              size: 30,
            ),
          ),
        ],


          // const SizedBox(
          //   width: 10,
          // ),
        leading: MyBackButton(),
        title: Text(
          "edit_contact_page",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      foregroundImage: Globals.allContacts[index].image != null
                          ? FileImage(Globals.allContacts[index].image!)
                          : null,
                      child: const Text("Add Image"),
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        ImagePicker picker = ImagePicker();

                        XFile? file =
                        await picker.pickImage(source: ImageSource.camera);

                        if (file != null) {
                          setState(() {
                            image = File(file.path);
                          });
                        }
                      },
                      mini: true,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
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
                  initialValue: Globals.allContacts[index].name,
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
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
                  initialValue: Globals.allContacts[index].email,
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Contact",
                      style: TextStyle(fontSize: 20), textAlign: TextAlign.start),
                ),
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
                  initialValue: Globals.allContacts[index].contact,
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