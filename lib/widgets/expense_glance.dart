import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/models/db_entities.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ExpensePieChart extends StatefulWidget {
  const ExpensePieChart({super.key});

  @override
  State<ExpensePieChart> createState() => _ExpensePieChartState();
}

class _ExpensePieChartState extends State<ExpensePieChart> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Transaction>>(
        stream: objectbox.getExpenseTransactionsForCurrentMonth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox();
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            double calculateBoxHeight(int numberOfItems) {
              return 340 + (numberOfItems * 20);
            }

            List<Transaction>? transactions = snapshot.data;
            double calculateOverallAmount(List<Transaction> transactions) {
              return transactions.fold(
                  0.0, (sum, transaction) => sum + transaction.amount);
            }

            final Map<String, double> categoryTotals = {};
            for (var transaction in transactions!) {
              final categoryName =
                  transaction.category.target?.name ?? 'Неизвестно';
              categoryTotals[categoryName] =
                  (categoryTotals[categoryName] ?? 0) + transaction.amount;
            }

            final List<PieChartSectionData> sections =
                categoryTotals.entries.map((entry) {
              final color = listColors[
                  categoryTotals.keys.toList().indexOf(entry.key) %
                      listColors.length];
              return PieChartSectionData(
                showTitle: false,
                color: color,
                value: entry.value,
                radius: 80,
              );
            }).toList();

            final legendItems = categoryTotals.entries.map((entry) {
              final color = listColors[
                  categoryTotals.keys.toList().indexOf(entry.key) %
                      listColors.length];
              return Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: '${entry.key}: ',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: NumberFormat.currency(
                                  locale: "ru_RU",
                                  name: 'RUB',
                                  decimalDigits: 2,
                                  symbol: '₽')
                              .format(entry.value))
                    ]),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              );
            }).toList();

            return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: calculateBoxHeight(categoryTotals.keys.length)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.surfaceContainer),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Text(
                          'Структура расходов',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: PieChart(
                            PieChartData(
                              sections: sections,
                              borderData: FlBorderData(show: false),
                              sectionsSpace: 2,
                              centerSpaceRadius: 40,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: 'Всего: ',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: NumberFormat.currency(
                                        locale: "ru_RU",
                                        name: 'RUB',
                                        decimalDigits: 2,
                                        symbol: '₽')
                                    .format(
                                        calculateOverallAmount(transactions)))
                          ])),
                        ),
                        Column(
                          children: legendItems,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text('Здесь будет структура ваших расходов'),
              ),
            ),
          );
        });
  }

  final List<Color> listColors = [
    const Color(0xFFF44336),
    const Color(0xFF4CAF50),
    const Color(0xFF2196F3),
    const Color(0xFFFF9800),
    const Color(0xFFC55FED),
    const Color(0xFF795548),
    const Color(0xFF3F51B5),
    const Color(0xFFFFC107),
    const Color(0xFF009688),
    const Color(0xFFFF5722),
    const Color(0xFF7B1FA2),
    const Color(0xFF8BC34A),
  ];
}
