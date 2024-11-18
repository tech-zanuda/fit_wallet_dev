import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/models/db_entities.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:intl/intl.dart';

class BarChartStatistics extends StatefulWidget {
  const BarChartStatistics({super.key, required this.isIncome});
  final bool isIncome;

  @override
  State<BarChartStatistics> createState() => _BarChartStatisticsState();
}

class _BarChartStatisticsState extends State<BarChartStatistics> {
  late Stream<List<Transaction>> transactionStream;

  @override
  void initState() {
    super.initState();
    transactionStream = objectbox.getTransactionsQuery();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final LinearGradient barsGradient = widget.isIncome
        ? LinearGradient(
            colors: [
              colorScheme.primaryContainer,
              Colors.cyan.shade400,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )
        : LinearGradient(
            colors: [
              colorScheme.secondaryContainer,
              Colors.amber.shade400,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          );

    final barTouchData = BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (group) => Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            TextStyle(
              color: widget.isIncome ? Colors.cyan : Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

    Widget getTitles(double value, TitleMeta meta) {
      final style = TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      String text;
      switch (value.toInt()) {
        case 0:
          text = 'Пн';
          break;
        case 1:
          text = 'Вт';
          break;
        case 2:
          text = 'Ср';
          break;
        case 3:
          text = 'Чт';
          break;
        case 4:
          text = 'Пт';
          break;
        case 5:
          text = 'Сб';
          break;
        case 6:
          text = 'Вс';
          break;
        default:
          text = '';
          break;
      }
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 4,
        child: Text(text, style: style),
      );
    }

    final titlesData = FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

    final borderData = FlBorderData(
      show: false,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.only(top: 10, right: 24, bottom: 16, left: 16),
        child: Column(
          children: [
            Text(
              widget.isIncome
                  ? 'Доходы за текущую неделю'
                  : 'Расходы за текущую неделю',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            StreamBuilder<List<Transaction>>(
                stream: transactionStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final transactionsForCurrentWeek =
                        getTransactionsForCurrentWeek(
                            snapshot.data!, widget.isIncome);
                    final maxTransactionValue =
                        transactionsForCurrentWeek.values.isNotEmpty
                            ? transactionsForCurrentWeek.values
                                .reduce((a, b) => a > b ? a : b)
                            : 0.0;

                    final maxY =
                        maxTransactionValue + (maxTransactionValue * 0.15);

                    final dayToIndex = {
                      "Monday": 0,
                      "Tuesday": 1,
                      "Wednesday": 2,
                      "Thursday": 3,
                      "Friday": 4,
                      "Saturday": 5,
                      "Sunday": 6,
                    };

                    final barGroups =
                        transactionsForCurrentWeek.entries.map((entry) {
                      final dayName = entry.key;
                      final dayIndex = dayToIndex[dayName] ?? 0;
                      final dayAmount = entry.value;

                      return BarChartGroupData(
                        x: dayIndex,
                        barRods: [
                          BarChartRodData(
                            toY: dayAmount,
                            gradient: barsGradient,
                          ),
                        ],
                        showingTooltipIndicators: [0],
                      );
                    }).toList();

                    return AspectRatio(
                      aspectRatio: 1.4,
                      child: BarChart(
                        BarChartData(
                          barTouchData: barTouchData,
                          titlesData: titlesData,
                          borderData: borderData,
                          barGroups: barGroups,
                          gridData: const FlGridData(show: false),
                          alignment: BarChartAlignment.spaceAround,
                          maxY: maxY,
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                        child: widget.isIncome
                            ? Text('Доходов пока нет')
                            : Text('Расходов пока нет')),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Map<String, double> getTransactionsForCurrentWeek(
      List<Transaction> transactions, bool isIncome) {
    DateTime now = DateTime.now();
    DateTime startOfWeek =
        DateTime(now.year, now.month, now.day - (now.weekday - 1));
    DateTime endOfWeek =
        DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day + 6);

    List<Transaction> currentWeekTransactions =
        transactions.where((transaction) {
      return isIncome
          ? transaction.date
                  .isAfter(startOfWeek.subtract(const Duration(seconds: 1))) &&
              transaction.date
                  .isBefore(endOfWeek.add(const Duration(seconds: 1))) &&
              transaction.isIncome
          : transaction.date
                  .isAfter(startOfWeek.subtract(const Duration(seconds: 1))) &&
              transaction.date
                  .isBefore(endOfWeek.add(const Duration(seconds: 1))) &&
              !transaction.isIncome;
    }).toList();

    var groupedByDay = groupBy<Transaction, String>(
      currentWeekTransactions,
      (transaction) => DateFormat('EEEE').format(transaction.date),
    );

    Map<String, double> dailyTotals = {};
    for (var entry in groupedByDay.entries) {
      double dailyTotal =
          entry.value.fold(0.0, (sum, transaction) => sum + transaction.amount);
      dailyTotals[entry.key] = dailyTotal;
    }

    return dailyTotals;
  }
}
