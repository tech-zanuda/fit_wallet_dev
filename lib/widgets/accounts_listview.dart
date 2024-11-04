import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/pages/add_account_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountsListView extends StatelessWidget {
  const AccountsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: objectbox.getAccounts(),
      builder: (context, snapshot) => ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 60),
        child: ListView.builder(
            clipBehavior: Clip.none,
            padding: EdgeInsets.only(left: 16, right: 5),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.hasData ? (snapshot.data!.length + 1) : 0,
            itemBuilder: (BuildContext context, int index) {
              if (snapshot.hasData && index == snapshot.data!.length) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return NewAccountPage();
                    }));
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 11),
                      width: 160,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 6,
                                spreadRadius: .5,
                                offset: Offset(0, 2),
                                blurStyle: BlurStyle.normal)
                          ]),
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline_rounded,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Добавить\nновый счёт',
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      )),
                );
              } else if (snapshot.hasData) {
                final account = snapshot.data;
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 160,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 6,
                            spreadRadius: .5,
                            offset: Offset(0, 2))
                      ]),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 136,
                                child: Text(account![index].name,
                                    softWrap: false,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ),
                              SizedBox(
                                width: 136,
                                child: Text(
                                  NumberFormat.currency(
                                          locale: "ru_RU",
                                          name: 'RUB',
                                          decimalDigits: 2,
                                          symbol: '₽')
                                      .format(account[index].amount),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }
}
