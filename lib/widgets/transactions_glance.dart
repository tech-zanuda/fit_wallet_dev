import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/models/db_entities.dart';
import 'package:fit_wallet/pages/add_transaction_page.dart';
import 'package:fit_wallet/pages/edit_transaction_page.dart';
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
    NumberFormat numberFormat = NumberFormat.currency(
      locale: "ru_RU",
      name: 'RUB',
      decimalDigits: 2,
      symbol: '₽',
    );

    double calculateBoxHeight(int numberOfItems) {
      switch (numberOfItems) {
        case 0:
          return 95;
        case 1:
          return 111;
        case 2:
          return 183;
        case 3:
          return 255;
        default:
          return 255;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: StreamBuilder<List<Transaction>>(
        stream: transactionStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 255,
            );
          }
          final int numberOfItems =
              snapshot.hasData ? snapshot.data!.length : 0;
          final double boxHeight = calculateBoxHeight(numberOfItems);

          return Ink(
            width: MediaQuery.of(context).size.width,
            height: boxHeight,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  if (snapshot.hasData && snapshot.data!.isNotEmpty)
                    ...snapshot.data!.take(3).map((transaction) {
                      final accountName =
                          transaction.account.target?.name ?? 'Нет счета';
                      final categoryName =
                          transaction.category.target?.name ?? 'Нет категории';

                      return ListTile(
                        key: ObjectKey(transaction.id),
                        titleAlignment: ListTileTitleAlignment.center,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditTransactionPage(
                                        transactionId: transaction.id,
                                      )));
                        },
                        title: Text(
                          categoryName,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          DateFormat('dd LLL HH:mm', 'ru')
                              .format(transaction.date),
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.outline,
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                transaction.isIncome
                                    ? '${numberFormat.format(transaction.amount)}\n'
                                    : '-${numberFormat.format(transaction.amount)}\n',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: transaction.isIncome
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                              Text(accountName),
                            ],
                          ),
                        ),
                      );
                    })
                  else
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      leading: const Icon(Icons.add_rounded),
                      title: const Text('Добавьте свою первую запись'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddTransactionPage(),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
