import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/models/db_entities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class TransactionsGlance extends StatefulWidget {
  const TransactionsGlance({super.key});

  @override
  State<TransactionsGlance> createState() => _TransactionsGlanceState();
}

class _TransactionsGlanceState extends State<TransactionsGlance> {
  late Stream<List<Transaction>> transactionStream;
  late StreamSubscription accountSubscription;

  @override
  void initState() {
    super.initState();
    transactionStream = objectbox.getTransactionsQuery();
    accountSubscription = objectbox.getAccountsQuery().listen((_) {
      setState(() {
        transactionStream = objectbox.getTransactionsQuery();
      });
    });
  }

  @override
  void dispose() {
    accountSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Ink(
        width: MediaQuery.of(context).size.width,
        height: 255,
        decoration: BoxDecoration(
            color: colorScheme.surfaceContainer,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Последние записи',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              StreamBuilder<List<Transaction>>(
                  stream: transactionStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final transactions = snapshot.data!.take(3).toList();
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: transactions.map((transaction) {
                          final accountName =
                              transaction.account.target?.name ?? 'Нет счета';
                          final categoryName =
                              transaction.category.target?.name ??
                                  'Нет категории';

                          return ListTile(
                            key: ObjectKey(transaction.id),
                            titleAlignment: ListTileTitleAlignment.center,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            onTap: () {},
                            title: Text(
                              categoryName,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                                DateFormat('dd LLL HH:mm', 'ru')
                                    .format(transaction.date),
                                style: TextStyle(
                                    fontSize: 12, color: colorScheme.outline)),
                            trailing: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        '${NumberFormat.currency(locale: "ru_RU", name: 'RUB', decimalDigits: 2, symbol: '₽').format(transaction.amount)}\n',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: transaction.isIncome
                                                ? Colors.green
                                                : Colors.red)),
                                    Text(accountName),
                                  ]),
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return SizedBox();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
