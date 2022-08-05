import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/constant.dart';
import 'package:untitled1/db/db_operation.dart';
import 'package:untitled1/models/contact.dart';
import 'package:untitled1/screens/contact_screen.dart';
import 'package:untitled1/screens/update_contact_screen.dart';

import '../provider/contact_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  get contacts => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ContactProvider>(context, listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () =>
                  // Navigator.pushNamed(context, '/create_contact_screen'),
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactScreen(),
                ),
              ),
            ),
          ],
        ),
        body: Consumer<ContactProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: value.contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateContactScreen(
                          contact: value.contacts[index],
                          title: 'Update',
                        ),
                      ),
                    );
                  },
                  leading:
                      const Icon(Icons.contact_mail_sharp, color: Colors.blue),
                  title: Text(
                    value.contacts[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red.shade800),
                    onPressed: () => delete(value.contacts[index].id),
                  ),
                );
              },
            );
          },
        ));
  }

  // Future<bool> delete(int id) async {
  //   bool deleted =
  //       await Provider.of<ContactProvider>(context, listen: false).delete(id);
  // if (deleted) {
  //   int index = contact.indexWhere((element) => element.id == id);
  //   if (index != -1) {
  //     Contact.removeAt(index);
  //     notifyListeners();
  //   }
  // }
  // return deleted;
  // }

  Future<void> delete(int id) async {
    bool deleted =
        await Provider.of<ContactProvider>(context, listen: false).delete(id);
    if (deleted) {
      showSnackBar(context: context, message: 'success', error: false);
    } else {
      showSnackBar(context: context, message: 'not success', error: true);
    }
  }
}
