import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/models/db_entities.dart';
import 'package:fit_wallet/utils/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  bool _isIncome = false;
  DateTime? _selectedDate;
  Account? _selectedAccount;
  TransactionCategory? _selectedCategory;

  final accounts = objectbox.getAccounts();
  final categories = objectbox.getTransactionCategories();

  void _addTransaction() {
    if (_formKey.currentState!.validate()) {
      final amount =
          ((double.parse(_amountController.text) * 100).round() / 100);
      final note = _noteController.text.trim();

      final transaction = Transaction(
          amount: amount, isIncome: _isIncome, note: note, date: _selectedDate);
      transaction.account.target = _selectedAccount;
      transaction.category.target = _selectedCategory;

      objectbox.putTransaction(transaction);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новая запись'),
        automaticallyImplyLeading: false,
        leading: TextButton(
            style: ButtonStyle(visualDensity: VisualDensity(horizontal: -4)),
            onPressed: () => Navigator.pop(context),
            child: SvgIcon(
              SvgIcons.closeCircle,
              color: Theme.of(context).colorScheme.onSurface,
            )),
        actions: [
          TextButton(
              style: ButtonStyle(visualDensity: VisualDensity(horizontal: -4)),
              onPressed: () {
                _addTransaction();
              },
              child: SvgIcon(
                SvgIcons.checkCircle,
                color: Theme.of(context).colorScheme.onSurface,
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ChoiceChip(
                        // INCOME
                        showCheckmark: false,
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                        label: SizedBox(child: Center(child: Text("Доход"))),
                        selected: _isIncome,
                        onSelected: (selected) {
                          setState(() {
                            _isIncome = true;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: ChoiceChip(
                        // EXPENSE
                        showCheckmark: false,
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                        label: SizedBox(child: Center(child: Text("Расход"))),
                        selected: !_isIncome,
                        onSelected: (selected) {
                          setState(() {
                            _isIncome = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  height: 50,
                ),
                Text('Введите сумму:'),
                SizedBox(
                  // AMOUNT
                  height: 5,
                ),
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Сумма'),
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
                SizedBox(height: 16),
                Text('Выберите дату:'),
                ListTile(
                  // DATE
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  title: Text(
                    _selectedDate == null
                        ? 'Выбрать дату'
                        : DateFormat('dd.MM.yyy HH:mm').format(_selectedDate!),
                  ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      if (context.mounted) {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            _selectedDate = DateTime(
                              picked.year,
                              picked.month,
                              picked.day,
                              time.hour,
                              time.minute,
                            );
                          });
                        }
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField<Account>(
                  // ACCOUNT
                  decoration: InputDecoration(labelText: 'Счет'),
                  value: _selectedAccount,
                  items: accounts.map((account) {
                    return DropdownMenuItem<Account>(
                      value: account,
                      child: Text(account.name),
                    );
                  }).toList(),
                  onChanged: (Account? newAccount) {
                    setState(() {
                      _selectedAccount = newAccount;
                    });
                  },
                  validator: (value) => value == null ? 'Выберите счет' : null,
                ),
                SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField<TransactionCategory>(
                  // CATEGORY
                  decoration: InputDecoration(labelText: 'Категория'),
                  value: _selectedCategory,
                  items: categories.map((category) {
                    return DropdownMenuItem<TransactionCategory>(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: (TransactionCategory? newCategory) {
                    setState(() {
                      _selectedCategory = newCategory;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Выберите категорию' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  // NOTE
                  controller: _noteController,
                  decoration: InputDecoration(
                      labelText: 'Заметка', helperText: 'Необязательно'),
                ),
              ],
            )),
      )),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
