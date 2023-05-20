import 'package:flutter/material.dart';

import '../utils/MyGloballist.dart';


class Globals {
  static List<Contact> allContacts = contactname.map((e) => Contact.fromMap(data: e)).toList();
}