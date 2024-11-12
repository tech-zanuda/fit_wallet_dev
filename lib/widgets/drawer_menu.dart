import 'package:fit_wallet/utils/svg_icons.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), bottomRight: Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 125,
          ),
          Divider(
            height: 50,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: InkResponse(
              splashColor: colorScheme.onPrimaryFixed.withOpacity(0.1),
              containedInkWell: true,
              highlightShape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              onTap: () {},
              child: Ink(
                padding: EdgeInsets.fromLTRB(30, 8, 15, 8),
                decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgIcon(
                      width: 26,
                      height: 26,
                      SvgIcons.wallet,
                      color: colorScheme.onPrimaryContainer,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Text(
                      'Счета',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: colorScheme.onPrimaryContainer, fontSize: 18),
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
