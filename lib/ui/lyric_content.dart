import 'package:flutter/material.dart';

class LyricContent extends StatelessWidget {

  final GestureTapCallback onTapClose;

  const LyricContent({
    Key key,
    this.onTapClose
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: this.onTapClose,
            child: Container(
              height: 36,
              alignment: Alignment.center,
              child: Icon(Icons.arrow_drop_down),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 4.0),
                  child: Chip(
                    label: Text('Japanese'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4.0),
                  child: Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text('English'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4.0),
                  child: Chip(
                    label: Text('Romanji'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  child: Text("I don't want to forget these feelings I can't explain\r\nSo I'm breaking the norm, deleting the provided layout\r\nI'll sing my own song\r\nAnd send the words once locked within my breast to the sky\r\n\r\nThese things I want to tell you\r\nThe things I want to reach you\r\nMay they converge together\r\nAnd reach out to you\r\n\r\nAll these words I want to tell you\r\nAnd this song I want you to hear\r\nEverything is joined in a cirlce\r\nJoining us all together\r\nNo matter where you may be\r\n\r\nThis clear white light reminds me of your voice\r\nI felt it tumble into the palm of my hand\r\nIt caused my finger to suddenly move along with the beat\r\nI'm setting all of these words into that rhythm and sending them to the heavens\r\n\r\nThese things I want to tell you\r\nThe things I want to reach you\r\nMay they join a line\r\nThat they may reach you, so far away from me\r\n\r\nThese words I want to tell you\r\nAnd this song that I want you to hear\r\nThey join together with other, ordinary things\r\nConnecting us all together\r\nNo matter where we may be\r\n\r\nAs I dance through these unchanging days\r\nI began to think that they are a gift given to us\r\nAnd that moment I believed, my world began to shake\r\nTell me, I wanna know about your world! [Tell Your World]\r\n\r\nThese things I want to tell you\r\nThe things I that I want to reach you\r\nMay they join into a line\r\nSo they may reach you, so far away\r\n\r\nThese words I want to tell you\r\nAnd the song I want you to hear\r\nThey join together with other ordinary things\r\nConnecting us all to each other\r\nNo matter how far away we may be..")),
            ),
          )
        ],
      ),
    );
  }
}