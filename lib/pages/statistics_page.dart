import 'package:fit_wallet/widgets/expense_glance.dart';
import 'package:fit_wallet/widgets/line_chart_statistics.dart';
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
          LineChartStatistics(),
          SizedBox(
            height: 20,
          ),
          ExpensePieChart(),
        ],
      ),
    );
  }
}
