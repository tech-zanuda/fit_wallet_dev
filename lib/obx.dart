import 'package:fit_wallet/models/db_entities.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<TransactionCategory> _transactionCategory;
  late final Box<Transaction> _transaction;
  late final Box<Account> _account;

  ObjectBox._create(this.store) {
    _transactionCategory = Box<TransactionCategory>(store);
    _transaction = Box<Transaction>(store);
    _account = Box<Account>(store);

    if (_transactionCategory.isEmpty()) {
      _putCategories();
    }
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "obx-fitwallet"));
    return ObjectBox._create(store);
  }

  void _putCategories() {
    final categories = [
      TransactionCategory('Прочее'),
      TransactionCategory('Продукты'),
      TransactionCategory('Транспорт'),
      TransactionCategory('Аренда'),
      TransactionCategory('ЖКХ'),
      TransactionCategory('Развлечения')
    ];
    _transactionCategory.putManyAsync(categories);
  }

  int countCategories() {
    return _transactionCategory.count();
  }

  Stream<List<TransactionCategory>> getAllCategories() {
    return _transactionCategory
        .query()
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  Stream<List<Account>> getAccounts() {
    return _account
        .query()
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  Account? getAccount(int id) {
    return _account.get(id);
  }

  void removeAccount(int id) {
    _account.remove(id);
  }

  void removeAccounts() {
    _account.removeAll();
  }

  void putAccount(Account account) {
    _account.putAsync(account);
  }
}
