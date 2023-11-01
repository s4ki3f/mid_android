class Match {
  final String tournament;
  final int matchId;
  final String matchName;
  final String teamA;
  final String teamB;
  final String score;

  Match({
    required this.tournament,
    required this.matchId,
    required this.matchName,
    required this.teamA,
    required this.teamB,
    required this.score,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      tournament: json['Tournament'],
      matchId: json['Match_Id'],
      matchName: json['Match_name'],
      teamA: json['TeamA'],
      teamB: json['TeamB'],
      score: json['Score'],
    );
  }
}
