import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../modals/Globals.dart';
import '../../modals/Mybackicon.dart';

class contact_details extends StatefulWidget {
  const contact_details({Key? key}) : super(key: key);

  @override
  State<contact_details> createState() => _contact_detailsState();
}

class _contact_detailsState extends State<contact_details> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
        appBar: AppBar(
          leading: MyBackButton(),
          title: Text(
            "Contact_detail_page",
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                foregroundImage:  (Globals
                    .allContacts[index]
                    .image) !=
                    null
                    ? FileImage(Globals
                    .allContacts[index]
                    .image!)
                    : null,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(Globals.allContacts[index].name),
              const SizedBox(
                height: 20,
              ),
              Text(Globals.allContacts[index].contact),
              const SizedBox(
                height: 20,
              ),
              // Text("${Globals.allContacts[index].email}"),
              const SizedBox(
                height: 20,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      Uri call = Uri(
                        scheme: 'tel',
                        path: Globals.allContacts[index].contact,
                      );
                      try {
                        await launchUrl(call);
                      } on MissingPluginException {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: const Text(
                                "Please restrats the application !!"),
                          ),
                        );
                      } catch (e) {
                        print("=========================");
                        print("EXCEPTION: $e");
                        print("=========================");
                      }
                    },
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.call),
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      Uri mail = Uri(
                        scheme: 'mailto',
                        query:
                        "subject=This is demo mail&body=Dear ${Globals.allContacts[index].name},\n\tHere I've sent a demo mail from flutter testing software.",
                        path: Globals.allContacts[index].email,
                      );

                      await launchUrl(mail);
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.email),
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      Uri sms = Uri(
                        scheme: 'sms',
                        query:
                        "body=Dear ${Globals.allContacts[index].name},\n\tHere I've sent a demo mail from flutter testing software.",
                        path: Globals.allContacts[index].contact,
                      );

                      await launchUrl(sms);
                    },
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.message),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Share.shareXFiles(
                          [XFile(Globals.allContacts[index].image!.path)],
                          text:
                          "Name: ${Globals.allContacts[index].name}\nContact: ${Globals.allContacts[index].contact}\nEmail: ${Globals.allContacts[index].email}\n\nShared from ContactDiaryApp.");
                    },
                    backgroundColor: Colors.orange,
                    child: const Icon(Icons.share),
                  ),
                ],
              ),
              Divider(),
            ],
          ),
        ));
  }
}