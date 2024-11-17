import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/widgets/accounts_listview.dart';
import 'package:fit_wallet/widgets/expense_glance.dart';
import 'package:fit_wallet/widgets/transactions_glance.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          AccountsListView(),
          Divider(
            height: 40,
            thickness: 1,
          ),
          TransactionsGlance(),
          SizedBox(
            height: 20,
          ),
          ExpensePieChart(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
