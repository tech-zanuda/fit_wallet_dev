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

  Transaction? getTransaction(int id) {
    return _transaction.get(id);
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

  Stream<List<Transaction>> getExpenseTransactionsForCurrentMonth() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);

    return _transaction
        .query(Transaction_.date
            .between(startOfMonth.millisecondsSinceEpoch,
                endOfMonth.millisecondsSinceEpoch)
            .and(Transaction_.isIncome.equals(false)))
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  void removeAccount(int id) {
    store.runInTransaction(TxMode.write, () {
      final relatedTransactions =
          _transaction.query(Transaction_.account.equals(id)).build().find();

      for (var transaction in relatedTransactions) {
        _transaction.remove(transaction.id);
      }

      _account.remove(id);
    });
  }

  void putAccount(Account account) {
    _account.put(account);
  }

  void putTransaction(Transaction transaction) {
    _transaction.put(transaction);
  }

  void removeTransactions() {
    _transaction.removeAll();
  }

  List<Transaction> getTransactions() {
    return _transaction.getAll();
  }
}
