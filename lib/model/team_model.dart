class TeamModel {
  final String nama;
  final String stadion;
  final String negara;
  final String badge;
  final String deskripsi;

  TeamModel({
    required this.nama,
    required this.stadion,
    required this.negara,
    required this.badge,
    required this.deskripsi,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      nama: (json['strTeam'] ?? '-').toString(),
      stadion: (json['strStadium'] ?? '-').toString(),
      negara: (json['strCountry'] ?? '-').toString(),
      badge: (json['strBadge'] ?? '').toString(),
      deskripsi: (json['strDescriptionEN'] ?? '-').toString(),
    );
  }
}