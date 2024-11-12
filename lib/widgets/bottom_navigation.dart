import 'package:fit_wallet/providers/current_page_provider.dart';
import 'package:fit_wallet/utils/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonSplash = Theme.of(context).colorScheme.primary.withOpacity(0.1);
    CurrentPageProvider currentPage = context.read<CurrentPageProvider>();
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
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
                currentPage.setValue(0);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  currentPage.currentPageIndex != 0
                      ? SvgIcon(SvgIcons.home,
                          color: colorScheme.onPrimaryContainer)
                      : SvgIcon(SvgIcons.homeBold,
                          color: colorScheme.onPrimaryContainer),
                  Text(
                    'Главная',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
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
                currentPage.setValue(1);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  currentPage.currentPageIndex != 1
                      ? SvgIcon(
                          SvgIcons.cardTransfer,
                          color: colorScheme.onPrimaryContainer,
                        )
                      : SvgIcon(
                          SvgIcons.cardTransferBold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                  Text(
                    'Записи',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
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
                currentPage.setValue(2);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  currentPage.currentPageIndex != 2
                      ? SvgIcon(
                          SvgIcons.chartSquare,
                          color: colorScheme.onPrimaryContainer,
                        )
                      : SvgIcon(
                          SvgIcons.chartSquareBold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                  Text(
                    'Статистика',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
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
                  SvgIcon(
                    SvgIcons.hamburgerMenu,
                    color: colorScheme.onPrimaryContainer,
                  ),
                  Text(
                    'Меню',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
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
