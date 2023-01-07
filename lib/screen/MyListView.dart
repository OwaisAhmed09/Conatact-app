import 'package:comtact_app/screen/contact.dart';
import 'package:comtact_app/screen/crud_view.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:comtact_app/screen/MyListView.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _CrudOperationsState();
}

class _CrudOperationsState extends State<MyListView> {
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Phone_No = TextEditingController();

  editContact(context, index) {
    setState(() {
      contacts[index] = {
        "name": contacts[index]['Name'] == FirstName.text,
        "userName": contacts[index]['Surname'] == LastName.text,
        "number": contacts[index]['Phone'] == Phone_No.text,
      };
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
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 25,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 169, 247, 240),
                      radius: 50,
                      child: Text("${contacts[index]['Name'][1]}"),
                    ),
                    title: Text(
                        '${contacts[index]['Name']} ${contacts[index]['LastName']}'),
                    subtitle: Text('${contacts[index]['Phonenumber']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                        title: const Text('Edit Contact'),
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "FirstName",
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
                                                    hintText: "Enter Your Name",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey))),
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
                                                    hintText:
                                                        "Enter Your Last Name",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey))),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "+92***",
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
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text("OK"),
                                            onPressed: () {
                                              editContact(context, index);
                                            },
                                          )
                                        ],
                                      )));
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                contacts.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (Context) => const CrudOperations()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
