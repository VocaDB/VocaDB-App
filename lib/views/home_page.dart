import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/parameters/parameters.dart';
import 'package:vocadb/repositories/repositories.dart';
import 'package:vocadb/shared_widgets/shared_widgets.dart';

class HomePage extends StatelessWidget {
  SongBloc highlightedBloc;

  @override
  Widget build(BuildContext context) {
    final songRepository =
        RepositoryProvider.of<VocaDBRepository>(context).songRepository;
    return Scaffold(
      appBar: AppBar(
        title: Text('VocaDB'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SongApiListView(
              title: SectionHeadText('Highlighted'),
              event: FetchHighlighted(
                  songParameter: SongParameter(fields: 'MainPicture,thumbUrl')),
            ),
          ],
        ),
      ),
    );
  }
}
