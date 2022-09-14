class Complaint {
  String title;
  String description;
  String categories;
  int votes;
  String status = "open";
  String? id = null;

  Complaint({
    required this.title,
    required this.categories,
    required this.description,
    required this.votes,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'category': categories,
        'votes': votes,
        'status': status,
        'id': id,
      };
}
