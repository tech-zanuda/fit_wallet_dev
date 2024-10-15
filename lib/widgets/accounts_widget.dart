import 'package:flutter/material.dart';

class AccountsWidget extends StatefulWidget {
  const AccountsWidget({super.key});

  @override
  State<AccountsWidget> createState() => _AccountsWidgetState();
}

class _AccountsWidgetState extends State<AccountsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.all(16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO: реализовать динамические данные из бд
              Text(
                'Наличные',
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                    color: Color(0xFFE9E9E9)),
              ),
              Text(
                '56 000 руб.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Color(0xFFE9E9E9), fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
