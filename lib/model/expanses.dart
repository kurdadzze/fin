import 'package:expenses_app/utils.dart';


class ExpensesField {
  static const createdTime = 'createdTime';
}

class Expenses {
  DateTime createdTime;
  // String title;
  // String id;
  // String description;
  // bool isDone;

  Expenses({
    required this.createdTime,
    // required this.title,
    // this.description = '',
    // required this.id,
    // this.isDone = false,
  });

    static Expenses fromJson(Map<String, dynamic> json) => Expenses(
    createdTime: Utils.toDateTime(json['createdTime'])!,
    // title: json['title'],
    // description: json['description'],
    // id: json['id'],
    // isDone: json['isDone'],
  );

  Map<String, dynamic> toJson() => {
    'createdTime': Utils.fromDateTimeToJson(createdTime),
    // 'title': title,
    // 'description': description,
    // 'id': id,
    // 'isDone': isDone,
  };
}