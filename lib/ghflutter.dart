import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'member.dart';
import 'strings.dart' as strings;

class GHFlutter extends StatefulWidget {
  const GHFlutter({Key? key}) : super(key: key);

  @override
  _GHFlutterState createState() => _GHFlutterState();
}

class _GHFlutterState extends State<GHFlutter> {
  final _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Future<void> _loadData() async {
    const dataUrl = 'https://api.github.com/orgs/raywenderlich/members';
    final response = await http.get(Uri.parse(dataUrl));
    setState(() {
      final dataList = json.decode(response.body) as List;
      for (final item in dataList) {
        final login = item['login'] as String? ?? '';
        final avatarUrl = item['avatar_url'] as String? ?? '';
        final member = Member(login, avatarUrl);
        _members.add(member);
      }
    });
  }

  Widget _buildRow(Member member) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          backgroundImage: NetworkImage(member.avatarUrl),
        ),
        title: Text(member.login, style: _biggerFont),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(strings.appTitle),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int position) =>
              _buildRow(_members[position]),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: _members.length,
        ));
  }
}
