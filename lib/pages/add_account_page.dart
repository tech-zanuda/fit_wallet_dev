import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/models/db_entities.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({super.key});

  @override
  State<NewAccountPage> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _colorController = TextEditingController();

  void _addAccount() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final amount =
          ((double.parse(_amountController.text) * 100).round() / 100);
      final color = _colorController.text;

      final account = Account(name: name, amount: amount, color: color);

      objectbox.putAccount(account);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новый счёт'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'lib/assets/lottie/add_account.json',
            height: 250,
            repeat: false,
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
              left: 16.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: 'Название счёта'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите название';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(labelText: 'Сумма на счёте'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите сумму';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Неправильный формат суммы';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 76,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary),
                        onPressed: _addAccount,
                        child: Text(
                          'Добавить счёт',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _colorController.dispose();
    super.dispose();
  }
}