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
                context: context,
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
          title: const Text(
            'Главная',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: false,
        ),
        body: pages[page.currentPageIndex],
      ),
    );
  }
}



// class CategoriesView extends StatelessWidget {
//   const CategoriesView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: objectbox.getAllCategories(),
//       builder: (context, snapshot) => ListView.builder(
//           itemCount: objectbox.countCategories(),
//           itemBuilder: (BuildContext context, int index) {
//             final category = snapshot.data;
//             return Column(
//               children: [
//                 ListTile(
//                   title: Text(category![index].name),
//                   subtitle: Text(category[index].id.toString()),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 )
//               ],
//             );
//           }),
//     );
//   }
// }
