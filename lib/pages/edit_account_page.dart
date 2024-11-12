import 'package:fit_wallet/main.dart';
import 'package:fit_wallet/models/db_entities.dart';
import 'package:fit_wallet/utils/svg_icons.dart';
import 'package:flutter/material.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key, required this.accountId});
  final int accountId;

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  late Account? accountInfo;
  late TextEditingController _nameController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadAccountData();
    _nameController = TextEditingController(text: accountInfo!.name);
  }

  void _loadAccountData() {
    accountInfo = objectbox.getAccount(widget.accountId);
  }

  void _editAccount() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final account =
          Account(id: accountInfo!.id, name: name, amount: accountInfo!.amount);

      objectbox.putAccount(account);
      Navigator.pop(context);
    }
  }

  void _deleteAccount() {
    objectbox.removeAccount(accountInfo!.id);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Ок',
          onPressed: () {},
          textColor: Theme.of(context).colorScheme.onPrimaryFixed,
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
        content: Text('Удален счет ${accountInfo!.name}',
            style:
                TextStyle(color: Theme.of(context).colorScheme.onPrimaryFixed)),
        duration: const Duration(milliseconds: 10000),
        width: MediaQuery.of(context).size.width * 0.95,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Изменить счет'),
        leading:
            // BACK
            TextButton(
                style: TextButton.styleFrom(
                    visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: SvgIcon(
                  SvgIcons.closeSquareBold,
                  color: Theme.of(context).colorScheme.onSurface,
                )),
        actions: [
          // DONE
          TextButton(
              onPressed: () {
                _editAccount();
              },
              style: TextButton.styleFrom(
                  visualDensity:
                      VisualDensity(horizontal: VisualDensity.minimumDensity)),
              child: SvgIcon(
                SvgIcons.checkSquareBold,
                color: Theme.of(context).colorScheme.onSurface,
              )),
          // DELETE
          TextButton(
              style: TextButton.styleFrom(
                  visualDensity:
                      VisualDensity(horizontal: VisualDensity.minimumDensity)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("Удаление счета"),
                        content: Text(
                          'Вы действительно хотите удалить счет?',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Отмена'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _deleteAccount();
                            },
                            child: Text('Да'),
                          ),
                        ],
                      );
                    });
              },
              child: SvgIcon(
                SvgIcons.trashBinBold,
                color: Theme.of(context).colorScheme.onSurface,
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Название счёта'),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().isEmpty) {
                      return 'Введите название';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
