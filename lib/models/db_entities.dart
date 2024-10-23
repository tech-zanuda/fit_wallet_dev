import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Account {
  @Id()
  int id;

  String name;
  double amount;
  String? color;

  Account({this.id = 0, required this.name, required this.amount, this.color});
}

@Entity()
class TransactionCategory {
  @Id()
  int id;

  String name;

  TransactionCategory(this.name, {this.id = 0});
}

@Entity()
class Transaction {
  @Id()
  int id;

  double amount;
  bool isIncome;
  String? note;
  DateTime date;

  final account = ToOne<Account>();
  final category = ToOne<TransactionCategory>();

  Transaction(
      {this.id = 0,
      required this.amount,
      required this.isIncome,
      this.note,
      DateTime? date})
      : date = date ?? DateTime.now();

  String get dateFormat => DateFormat('dd.MM.yyyy hh:mm').format(date);
}
