class SubExchange {
  final String name;
  final String value;

  SubExchange({
    required this.name,
    required this.value,
  });

  factory SubExchange.fromJson(Map<String, dynamic> json) {
    return SubExchange(
      name: json['name'],
      value: json['value'],
    );
  }
}
