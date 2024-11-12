import 'package:flutter/material.dart';

class TransactionsGlance extends StatefulWidget {
  const TransactionsGlance({super.key});

  @override
  State<TransactionsGlance> createState() => _TransactionsGlanceState();
}

class _TransactionsGlanceState extends State<TransactionsGlance> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
            color: colorScheme.surfaceContainer,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Text(
            'Последние записи',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
