import 'package:fit_wallet/pages/home_page.dart';
import 'package:fit_wallet/pages/statistics_page.dart';
import 'package:fit_wallet/pages/transactions_page.dart';
import 'package:fit_wallet/providers/current_page_provider.dart';
import 'package:fit_wallet/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List pages = [
    const HomePage(),
    const TransactionsPage(),
    const StatisticsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Color buttonSplash = Theme.of(context).colorScheme.primary.withOpacity(0.1);

    return Consumer<CurrentPageProvider>(
      builder: (context, value, child) => Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Drawer')],
          ),
        ),
        bottomNavigationBar:
            CustomBottomNavigationBar(buttonSplash: buttonSplash),
        appBar: AppBar(
          title: const Text('Главная'),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(child: pages[value.currentPageIndex]),
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
