

class TaskModel {
  final String id;
  final String title;
  final bool iscompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.iscompleted,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'iscompleted': iscompleted,
      };

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        title: json['title'],
        iscompleted: json['iscompleted'],
      );

  TaskModel copyWith({String? id, String? title, bool? iscompleted}) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      iscompleted: iscompleted ?? this.iscompleted,
    );
  }
}
