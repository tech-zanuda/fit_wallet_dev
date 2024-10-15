import 'package:fit_wallet/widgets/accounts_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        automaticallyImplyLeading: false,
      ),
      body: const SafeArea(
          child: Column(
        children: [AccountsWidget()],
      )),
    );
  }
}
