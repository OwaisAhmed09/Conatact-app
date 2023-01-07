import 'dart:html';
import 'package:comtact_app/screen/MyListView.dart';
import 'package:comtact_app/screen/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CrudOperations extends StatefulWidget {
  const CrudOperations({super.key});

  @override
  State<CrudOperations> createState() => _CrudOperationsState();
}

class _CrudOperationsState extends State<CrudOperations> {
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Phone_No = TextEditingController();

  addNewContact(context) {
    setState(() {
      Navigator.pop(context);
      contacts.add({
        "Name": FirstName.text,
        "LastName": LastName.text,
        "Phonenumber": Phone_No.text,
      });
      print(contacts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.lightBlue,
        ),
        title: Text(
          "Add",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.lightBlue),
        ),
        actions: [
          IconButton(
              onPressed: () {
                addNewContact(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyListView()));
              },
              icon: Icon(
                Icons.check,
                color: Colors.lightBlue,
                size: 25,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  child: TextField(
                    controller: FirstName,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Enter your First Name",
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter Your Last Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  child: TextField(
                    controller: LastName,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Enter Your Last Name",
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Phone-No",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  child: TextField(
                    controller: Phone_No,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "+92***",
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey))),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
