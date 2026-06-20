import 'dart:convert';

import 'package:http/http.dart' as waiter;

var apilink =
    "https://opentdb.com/api.php?amount=10&category=21&difficulty=easy&type=multiple";
getquestion() async {
  final request = await waiter.get(Uri.parse(apilink));
  if (request.statusCode == 200) {
    final data = jsonDecode(request.body.toString());
    return data;
  }
}