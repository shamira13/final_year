// import 'package:flutter/material.dart';
// import 'package:ade_flutterwave_working_version/core/ade_flutterwave.dart';

// class AdeFlutter extends StatefulWidget {
//   const AdeFlutter({Key? key}) : super(key: key);

//   @override
//   State<AdeFlutter> createState() => _AdeFlutterState();
// }

// class _AdeFlutterState extends State<AdeFlutter> {
//   //controllers
//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _fullNameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Ade Flutterwave payment'),
//           backgroundColor: Colors.orange,
//           foregroundColor: Colors.white,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Form(
//             child: Column(
//               children: [
//                 //title
//                 const Text(
//                   'Flutterwave payment',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _fullNameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Name',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(
//                     labelText: 'Phone',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _amountController,
//                   decoration: const InputDecoration(
//                     labelText: 'Amount',
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     //check if the fields are empty
//                     if (_amountController.text.isEmpty ||
//                         _emailController.text.isEmpty ||
//                         _phoneController.text.isEmpty ||
//                         _fullNameController.text.isEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Please fill all the fields'),
//                         ),
//                       );
//                       return;
//                     }
//                     //data
//                     var data = {
//                       'amount': _amountController.text,
//                       'email': _emailController.text,
//                       'phone': _phoneController.text,
//                       'name': _fullNameController.text,
//                       'payment_options': 'card, banktransfer, ussd',
//                       'title': 'Flutterwave payment',
//                       'currency': "UGX",
//                       'tx_ref':
//                           "AdeFlutterwave-${DateTime.now().millisecondsSinceEpoch}",
//                       'icon':
//                           "https://www.aqskill.com/wp-content/uploads/2020/05/logo-pde.png",
//                       'public_key':
//                           "FLWPUBK_TEST-e0787ab2e5b0b6fcb3d32ce465ad44d0-X",
//                       'sk_key':
//                           'FLWSECK_TEST-af1af523da3f141f894a26be4b071230-X'
//                     };

//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AdeFlutterWavePay(data),
//                       ),
//                     ).then((response) {
//                       //response is the response from the payment
//                       // print(response);
//                     });
//                   },
//                   child: const Text('Pay'),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
