import 'package:fit_wallet/models/db_entities.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ExpensePieChart extends StatelessWidget {
  final List<Transaction> transactions;

  const ExpensePieChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    // Filter transactions for the current month
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth =
        DateTime(now.year, now.month + 1, 0); // Last day of the month
    final filteredTransactions = transactions.where((transaction) {
      return transaction.date.isAfter(startOfMonth) &&
          transaction.date.isBefore(endOfMonth) &&
          !transaction.isIncome; // Only expenses
    }).toList();

    // Group by category and calculate totals
    final Map<String, double> categoryTotals = {};
    for (var transaction in filteredTransactions) {
      final categoryName = transaction.category.target?.name ?? 'Unknown';
      categoryTotals[categoryName] =
          (categoryTotals[categoryName] ?? 0) + transaction.amount;
    }

    // Create PieChart sections
    final List<PieChartSectionData> sections =
        categoryTotals.entries.map((entry) {
      final color = Colors.primaries[
          categoryTotals.keys.toList().indexOf(entry.key) %
              Colors.primaries.length];
      return PieChartSectionData(
        color: color,
        value: entry.value,
        title:
            '${entry.key}\n${NumberFormat.currency(locale: "ru_RU", name: 'RUB').format(entry.value)}',
        radius: 80,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      );
    }).toList();

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 350),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.surfaceContainer),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Расходы за месяц',
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
            ],
          ),
        ),
      ),
    );
  }
}
