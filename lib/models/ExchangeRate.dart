class ExchangeRate {
  final String branchName;
  final String message;
  final String exchange1Name;
  final double exchange1Buying;
  final double exchange1Selling;
  final String exchange2Name;
  final double exchange2Buying;
  final double exchange2Selling;
  final String exchange3Name;
  final double exchange3Buying;
  final double exchange3Selling;
  final String exchange4Name;
  final double exchange4Buying;
  final double exchange4Selling;
  final String exchange5Name;
  final double exchange5Buying;
  final double exchange5Selling;
  final String exchange6Name;
  final double exchange6Buying;
  final double exchange6Selling;
  final String updateDate;
  final String photoLink;
  final String photoLink2;
  final String photoLink3;

  ExchangeRate({
    required this.branchName,
    required this.message,
    required this.exchange1Name,
    required this.exchange1Buying,
    required this.exchange1Selling,
    required this.exchange2Name,
    required this.exchange2Buying,
    required this.exchange2Selling,
    required this.exchange3Name,
    required this.exchange3Buying,
    required this.exchange3Selling,
    required this.exchange4Name,
    required this.exchange4Buying,
    required this.exchange4Selling,
    required this.exchange5Name,
    required this.exchange5Buying,
    required this.exchange5Selling,
    required this.exchange6Name,
    required this.exchange6Buying,
    required this.exchange6Selling,
    required this.updateDate,
    required this.photoLink,
    required this.photoLink2,
    required this.photoLink3,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      branchName: json['branchName'],
      message: json['message'],
      exchange1Name: json['exchange1Name'],
      exchange2Name: json['exchange2Name'],
      exchange3Name: json['exchange3Name'],
      exchange4Name: json['exchange4Name'],
      exchange5Name: json['exchange5Name'],
      exchange6Name: json['exchange6Name'],
      exchange1Buying: convertToDouble(json['exchange1Buying']),
      exchange1Selling: convertToDouble(json['exchange1Selling']),
      exchange2Buying: convertToDouble(json['exchange2Buying']),
      exchange2Selling: convertToDouble(json['exchange2Selling']),
      exchange3Buying: convertToDouble(json['exchange3Buying']),
      exchange3Selling: convertToDouble(json['exchange3Selling']),
      exchange4Buying: convertToDouble(json['exchange4Buying']),
      exchange4Selling: convertToDouble(json['exchange4Selling']),
      exchange5Buying: convertToDouble(json['exchange5Buying']),
      exchange5Selling: convertToDouble(json['exchange5Selling']),
      exchange6Buying: convertToDouble(json['exchange6Buying']),
      exchange6Selling: convertToDouble(json['exchange6Selling']),
      updateDate: json['updateDate'],
      photoLink: json['photoLink'],
      photoLink2: json['photoLink2'],
      photoLink3: json['photoLink3'],
    );
  }
}

double convertToDouble(dynamic value) {
  return value is int ? value.toDouble() : value;
}
