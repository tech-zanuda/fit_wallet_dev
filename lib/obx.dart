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
      _putDemoCategories();
    }
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "obx-fitwallet"));
    return ObjectBox._create(store);
  }

  void _putDemoCategories() {
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

  Stream<List<Account>> getAccountsQuery() {
    return _account
        .query()
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  Stream<List<Transaction>> getTransactionsQuery() {
    return _transaction
        .query()
        .order(Transaction_.date, flags: Order.descending)
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  Account? getAccount(int id) {
    return _account.get(id);
  }

  TransactionCategory? getTransactionCategory(int id) {
    return _transactionCategory.get(id);
  }

  List<TransactionCategory> getTransactionCategories() {
    return _transactionCategory.getAll();
  }

  List<Account> getAccounts() {
    return _account.getAll();
  }

  void removeAccount(int id) {
    _account.remove(id);
  }

  void putAccount(Account account) {
    _account.put(account);
  }

  void putTransaction(Transaction transaction) {
    _transaction.put(transaction);
  }
}
