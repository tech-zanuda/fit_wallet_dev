import 'package:fit_wallet/main.dart';
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
      appBar: AppBar(
        title: const Text('Главная'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: Expanded(
              child: StreamBuilder(
            stream: objectbox.getAllCategories(),
            builder: (context, snapshot) => ListView.builder(
                itemCount: objectbox.countCategories(),
                itemBuilder: (BuildContext context, int index) {
                  final category = snapshot.data;
                  return Column(
                    children: [
                      ListTile(
                        title: Text(category![index].name),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  );
                }),
          )),
        ),
      ),
    );
  }
}
