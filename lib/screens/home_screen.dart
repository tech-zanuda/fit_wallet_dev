import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/screens/add_account.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return NewAccountScreen();
          }));
        },
        child: Icon(
          Icons.add_rounded,
          size: 40,
        ),
      ),
      appBar: AppBar(
        title: const Text('Главная'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            AccountsListView(),
          ],
        ),
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

class AccountsListView extends StatelessWidget {
  const AccountsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: objectbox.getAccounts(),
      builder: (context, snapshot) => SizedBox(
        height: 62,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.hasData ? snapshot.data!.length : 0,
            itemBuilder: (BuildContext context, int index) {
              if (snapshot.hasData) {
                final account = snapshot.data;
                return Container(
                  width: 160,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 1),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(account![index].name,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                account[index].amount.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 50,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: Color(int.parse(
                                          account[index].color!.substring(1, 7),
                                          radix: 16) +
                                      0xFF000000),
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          )
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
