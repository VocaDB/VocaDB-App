import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';

class RankingFilterPage extends StatefulWidget {
  static navigate(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RankingFilterPage()));
  }

  @override
  _RankingFilterPageState createState() => _RankingFilterPageState();
}

class _RankingFilterPageState extends State<RankingFilterPage> {
  @override
  void initState() {
    super.initState();
  }

  buildFilterBy(ConfigBloc configBloc) {
    return StreamBuilder(
      stream: configBloc.rankingFilterBy$,
      builder: (context, snapshot) {
        String value = snapshot.data;

        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Filter by',
                  style: Theme.of(this.context).textTheme.title),
            ),
            ListTile(
              title: const Text('Newly added'),
              leading: Radio(
                value: null,
                groupValue: value,
                onChanged: configBloc.updateRankingFilterBy,
              ),
            ),
            ListTile(
              title: const Text('Newly published'),
              leading: Radio(
                value: 'PublishDate',
                groupValue: value,
                onChanged: configBloc.updateRankingFilterBy,
              ),
            ),
            ListTile(
              title: const Text('Popularity'),
              leading: Radio(
                value: 'Popularity',
                groupValue: value,
                onChanged: configBloc.updateRankingFilterBy,
              ),
            ),
          ],
        );
      },
    );
  }

  buildVocalist(ConfigBloc configBloc) {
    return StreamBuilder(
      stream: configBloc.rankingVocalist$,
      builder: (context, snapshot) {
        String value = snapshot.data;

        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Vocalist',
                  style: Theme.of(this.context).textTheme.title),
            ),
            ListTile(
              title: const Text('All vocalists'),
              leading: Radio(
                value: null,
                groupValue: value,
                onChanged: configBloc.updateRankingVocalist,
              ),
            ),
            ListTile(
              title: const Text('Only Vocaloid'),
              leading: Radio(
                value: 'Vocaloid',
                groupValue: value,
                onChanged: configBloc.updateRankingVocalist,
              ),
            ),
            ListTile(
              title: const Text('Only UTAU'),
              leading: Radio(
                value: 'UTAU',
                groupValue: value,
                onChanged: configBloc.updateRankingVocalist,
              ),
            ),
            ListTile(
              title: const Text('Other vocalists'),
              leading: Radio(
                value: 'CeVIO',
                groupValue: value,
                onChanged: configBloc.updateRankingVocalist,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ConfigBloc configBloc = Provider.of<ConfigBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Ranking filter')),
      body: Column(
        children: <Widget>[
          buildFilterBy(configBloc),
          buildVocalist(configBloc)
        ],
      ),
    );
  }
}
