import 'package:fit_wallet/providers/current_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.buttonSplash,
  });

  final Color buttonSplash;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 1)
          ]),
      child: Material(
        type: MaterialType.transparency,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // HOME
            InkResponse(
              splashFactory: InkRipple.splashFactory,
              splashColor: buttonSplash,
              radius: 28,
              onTap: () {
                context.read<CurrentPageProvider>().setValue(0);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  Text(
                    'Главная',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            // TRANSACTIONS
            InkResponse(
              splashFactory: InkRipple.splashFactory,
              splashColor: buttonSplash,
              radius: 28,
              onTap: () {
                context.read<CurrentPageProvider>().setValue(1);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 30,
                  ),
                  Text(
                    'Записи',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            // STATISTICS
            InkResponse(
              splashFactory: InkRipple.splashFactory,
              splashColor: buttonSplash,
              radius: 28,
              onTap: () {
                context.read<CurrentPageProvider>().setValue(2);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.query_stats_outlined,
                    size: 30,
                  ),
                  Text(
                    'Статистика',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            //MENU
            InkResponse(
              splashFactory: InkRipple.splashFactory,
              splashColor: buttonSplash,
              radius: 28,
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Text(
                    'Меню',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
