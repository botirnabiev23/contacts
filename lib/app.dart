import 'package:contacts/pages/add_new_contract_page.dart';
import 'package:flutter/material.dart';
import 'pages/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePages(),
    );
  }
}
