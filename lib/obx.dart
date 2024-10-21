import 'package:fit_wallet/models/db_entities.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'objectbox.g.dart';

class ObjectBox {
  late final Store _store;

  late final Box<TransactionCategory> _transactionCategoryBox;

  ObjectBox._create(this._store) {
    _transactionCategoryBox = Box<TransactionCategory>(_store);

    if (_transactionCategoryBox.isEmpty()) {
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
      TransactionCategory('Продукты'),
      TransactionCategory('Транспорт'),
      TransactionCategory('Коммунальные услуги'),
      TransactionCategory('Аренда'),
      TransactionCategory('Развлечения'),
      TransactionCategory('Здоровье')
    ];
    _transactionCategoryBox.putManyAsync(categories);
  }
}
