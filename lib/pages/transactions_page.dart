import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/models/db_entities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  late Stream<List<Transaction>> transactionStream;
  NumberFormat numberFormat = NumberFormat.currency(
    locale: "ru_RU",
    name: 'RUB',
    decimalDigits: 2,
    symbol: '₽',
  );

  @override
  void initState() {
    super.initState();
    transactionStream = objectbox.getTransactionsQuery();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height),
      child: StreamBuilder(
          stream: transactionStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final List<Transaction>? transactions = snapshot.data;
                  final transaction = transactions![index];
                  final previousTransaction =
                      index > 0 ? transactions[index - 1] : null;
                  final bool showDateHeader = previousTransaction == null ||
                      !isSameDay(transaction.date, previousTransaction.date);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showDateHeader)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            DateFormat('dd MMM', 'ru').format(transaction.date),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onTap: () {},
                        title: Text(
                          transaction.category.target!.name,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          DateFormat('HH:mm', 'ru').format(transaction.date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.outline,
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
                              Text(transaction.account.target!.name),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(child: Text('Записи отсутствуют'));
            }
          }),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
