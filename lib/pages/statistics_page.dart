import 'package:fit_wallet/widgets/bar_chart_statistics.dart';
import 'package:fit_wallet/widgets/expense_pie_chart.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height),
      child: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          SizedBox(
            height: 10,
          ),
          BarChartStatistics(
            isIncome: true,
          ),
          SizedBox(
            height: 20,
          ),
          BarChartStatistics(
            isIncome: false,
          ),
          SizedBox(
            height: 20,
          ),
          ExpensePieChart(),
        ],
      ),
    );
  }
}
