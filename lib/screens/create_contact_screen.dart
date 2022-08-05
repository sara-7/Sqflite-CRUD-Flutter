// import 'package:elancer_database_project/helpers/helpers.dart';
// import 'package:elancer_database_project/models/contact.dart';
// import 'package:elancer_database_project/provider/contact_provider.dart';
// import 'package:elancer_database_project/widgets/app_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class CreateContactScreen extends StatefulWidget {
//   const CreateContactScreen({Key? key}) : super(key: key);
//
//   @override
//   _CreateContactScreenState createState() => _CreateContactScreenState();
// }
//
// class _CreateContactScreenState extends State<CreateContactScreen>
//     with Helpers {
//   late TextEditingController _nameTextController;
//   late TextEditingController _numberTextController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _nameTextController = TextEditingController();
//     _numberTextController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _nameTextController.dispose();
//     _numberTextController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Contact'),
//       ),
//       body: ListView(
//         physics: const NeverScrollableScrollPhysics(),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         children: [
//           const Text(
//             'Enter new contact details',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(height: 15),
//           AppTextField(
//             textEditingController: _nameTextController,
//             hint: 'Name',
//             prefixIcon: Icons.person,
//           ),
//           const SizedBox(height: 10),
//           AppTextField(
//             textEditingController: _numberTextController,
//             hint: 'Number',
//             prefixIcon: Icons.phone_android,
//           ),
//           const SizedBox(height: 15),
//           ElevatedButton(
//             onPressed: () async => await performCreate(),
//             child: const Text('SAVE'),
//             style: ElevatedButton.styleFrom(
//               minimumSize: const Size(0, 50),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<void> performCreate() async {
//     if(checkData()){
//       await create();
//     }
//   }
//
//   bool checkData() {
//     if (_nameTextController.text.isNotEmpty &&
//         _numberTextController.text.isNotEmpty) {
//       return true;
//     }
//     //SNACKBAR
//     showSnackBar(context: context, message: 'Enter required data!',error: true);
//     return false;
//   }
//
//   Future<void> create() async {
//     bool created = await Provider.of<ContactProvider>(context, listen: false).create(contact);
//     if (created) clear();
//     String message = created ? 'Created successfully' : 'Create failed';
//     showSnackBar(context: context, message: message, error: !created);
//   }
//
//   Contact get contact {
//     Contact c = Contact();
//     c.name = _nameTextController.text;
//     c.phone = _numberTextController.text;
//     return c;
//   }
//
//   void clear() {
//     _nameTextController.text = '';
//     _numberTextController.text = '';
//   }
// }
