import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/models/db_entities.dart';
import 'package:flutter/material.dart';

class NewAccountScreen extends StatefulWidget {
  const NewAccountScreen({super.key});

  @override
  State<NewAccountScreen> createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _colorController = TextEditingController();

  void _addAccount() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final amount = double.parse(_amountController.text);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Название счёта'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите название';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Сумма на счёте'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
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
              TextFormField(
                controller: _colorController,
                decoration: InputDecoration(labelText: 'Цвет'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите цвет';
                  }
                  if (!RegExp(r'^#(?:[0-9a-fA-F]{3}){1,2}$').hasMatch(value)) {
                    return 'Неправильный формат';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addAccount,
                child: Text('Добавить счёт'),
              ),
            ],
          ),
        ),
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
