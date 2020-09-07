import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';

class ExpansionTileSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ExpansionTile'),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;

}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry('Chapter A',
  ),
  Entry('Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry('Chapter C',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry('Section C2',
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return ListTile(
        title: Text(root.title)
        
      );
    return Container(
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(root.title),
        children: root.children.map<Widget>(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}