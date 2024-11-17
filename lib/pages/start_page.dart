import 'package:fit_wallet/pages/add_account_page.dart';
import 'package:fit_wallet/pages/add_transaction_page.dart';
import 'package:fit_wallet/pages/home_page.dart';
import 'package:fit_wallet/pages/statistics_page.dart';
import 'package:fit_wallet/pages/transactions_page.dart';
import 'package:fit_wallet/providers/current_page_provider.dart';
import 'package:fit_wallet/widgets/bottom_navigation.dart';
import 'package:fit_wallet/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List pages = [
    const HomePage(),
    const TransactionsPage(),
    const StatisticsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentPageProvider>(
      builder: (context, page, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerHigh,
                context: context,
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 4,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .outline
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Добавить:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AddAccountPage()));
                          },
                          title: Text('Новый счет'),
                        ),
                        Divider(
                          height: 8,
                          thickness: 1,
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHigh,
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AddTransactionPage()));
                          },
                          title: Text('Новая запись'),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Icon(
            Icons.add_rounded,
            size: 30,
          ),
        ),
        key: scaffoldKey,
        drawer: DrawerMenu(),
        bottomNavigationBar: CustomBottomNavigationBar(),
        appBar: AppBar(
          toolbarHeight: 40,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
          title: Text(
            appbarTitle(),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: false,
        ),
        body: pages[page.currentPageIndex],
      ),
    );
  }

  String appbarTitle() {
    int currentPage = Provider.of<CurrentPageProvider>(context, listen: false)
        .currentPageIndex;
    switch (currentPage) {
      case 0:
        return 'Главная';
      case 1:
        return 'Записи';
      case 2:
        return 'Статистика';
      default:
        return '';
    }
  }
}
