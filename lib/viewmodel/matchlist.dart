import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mid_android/model/match.dart';
import 'package:mid_android/viewmodel/results_page.dart';

class MatchList extends StatefulWidget {
  const MatchList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  List<Match> matches = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/3b613eec-3061-44bb-844c-f58c217d5063'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      matches = jsonData.map((map) => Match.fromJson(map)).toList();
      setState(() {});
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Data'),
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          Match match = matches[index];
          return ListTile(
            title: Text(match.matchName),
            subtitle: Text('${match.teamA} vs ${match.teamB} - ${match.score}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultsPage(matches: matches)),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
