import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartStatistics extends StatelessWidget {
  final List<double> dailySpending = [
    10,
    20,
    15,
    30,
    25,
    40,
    35,
    50,
    45,
    60,
    55,
    70,
    65,
    80,
    75,
    90,
    85,
    100,
    95,
    110,
    105,
    120,
    115,
    130,
    125,
    140,
    135,
    150,
    145,
    160,
    165
  ];

  LineChartStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
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
              'Расходы за текущий месяц',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 1.4,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 20,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: colorScheme.outline.withOpacity(0.1),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 20,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}k',
                            style: TextStyle(
                              color: colorScheme.outline.withOpacity(0.6),
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        getTitlesWidget: (value, meta) {
                          const months = ['MAR', 'JUN', 'SEP', 'DEC'];
                          return Text(
                            months[(value ~/ 10) % months.length],
                            style: TextStyle(
                              color: colorScheme.outline.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: colorScheme.outline.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: 30, // Assume 30 days in the month
                  minY: 10,
                  maxY: 170,
                  lineBarsData: [
                    LineChartBarData(
                      spots: dailySpending
                          .asMap()
                          .entries
                          .map((entry) =>
                              FlSpot(entry.key.toDouble(), entry.value))
                          .toList(),
                      isCurved: true,
                      color: colorScheme.primaryContainer,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            colorScheme.primaryContainer.withOpacity(0.4),
                            colorScheme.primaryContainer.withOpacity(0.1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 3.5,
                            color: colorScheme.primaryContainer,
                            strokeWidth: 1.75,
                            strokeColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? colorScheme.primaryFixedDim
                                    : colorScheme.primaryFixed,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
