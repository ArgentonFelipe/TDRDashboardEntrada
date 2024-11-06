enum ConferenceType {
  collector(description: 'Coletor', type: 0),
  tdr(description: 'TDRConfereC', type: 1),
  unknown(description: 'Conferida', type: 100);

  const ConferenceType({required this.type, required this.description});

  final int type;
  final String description;

  static ConferenceType getStatus(String status) {
    switch (status) {
      case 'Coletor':
        return ConferenceType.collector;
      case 'TDRConfereE':
        return ConferenceType.tdr;
      default:
        return ConferenceType.unknown;
    }
  }
}
