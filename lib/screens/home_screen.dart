import 'package:fit_wallet/screens/add_account.dart';
import 'package:fit_wallet/widgets/accounts_listview.dart';
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
          mainAxisSize: MainAxisSize.min,
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

