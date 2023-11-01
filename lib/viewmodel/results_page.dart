import 'package:flutter/material.dart';
import 'package:mid_android/model/match.dart';

class ResultsPage extends StatelessWidget {
  final List<Match> matches;

  const ResultsPage({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Results'),
      ),
      body: DataTable(
        columns: const [
          DataColumn(label: Text('Team A')),
          DataColumn(label: Text('Team B')),
          DataColumn(label: Text('Score')),
        ],
        rows: matches.map((match) {
          return DataRow(
            cells: [
              DataCell(Text(match.teamA)),
              DataCell(Text(match.teamB)),
              DataCell(Text(match.score)),
            ],
          );
        }).toList(),
      ),
    );
  }
}
