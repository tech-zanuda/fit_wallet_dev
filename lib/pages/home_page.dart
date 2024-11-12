import 'package:fit_wallet/widgets/accounts_listview.dart';
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
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        AccountsListView(
          key: ValueKey(Theme.of(context).brightness),
        ),
        Divider(
          height: 30,
          thickness: 1,
        ),
        TransactionsGlance()
      ],
    );
  }
}
