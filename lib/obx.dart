import 'package:fit_wallet/models/db_entities.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<TransactionCategory> _transactionCategory;

  ObjectBox._create(this.store) {
    _transactionCategory = Box<TransactionCategory>(store);

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
}
