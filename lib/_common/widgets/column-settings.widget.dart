import 'package:flutter/material.dart';

class SettingsPopup extends StatefulWidget {
  const SettingsPopup({super.key});

  @override
  _SettingsPopupState createState() => _SettingsPopupState();
}

class _SettingsPopupState extends State<SettingsPopup> {
  List<String> visibleColumns = ['Icon', 'Code', 'Name'];
  List<String> invisibleColumns = ['Links', 'Latest Price', 'RSI 1h', 'RSI 2h', 'RSI 3h'];

  void moveEntry(int index, bool toTable2) {
    setState(() {
      if (toTable2) {
        invisibleColumns.add(visibleColumns.removeAt(index));
      } else {
        visibleColumns.add(invisibleColumns.removeAt(index));
      }
    });
  }

  void reorderItem(List<String> table, int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = table.removeAt(oldIndex);
      table.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    double height = MediaQuery.of(context).size.height * 0.6;

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Visible Columns',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Invisible Columns',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Visible Columns
                Expanded(
                  child: ReorderableListView(
                    shrinkWrap: true,
                    onReorder: (oldIndex, newIndex) {
                      reorderItem(visibleColumns, oldIndex, newIndex);
                    },
                    children: 
                      List.generate(
                      visibleColumns.length,
                      (index) {
                        return Container(
                          key: ValueKey(visibleColumns[index]),
                          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(47, 78, 78, 78)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(visibleColumns[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              color: Colors.blue,
                              onPressed: () {
                                moveEntry(index, true);
                             },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.grey,
                ),

                // Invisble columns
                Expanded(
                  child: ReorderableListView(
                    shrinkWrap: true,
                    onReorder: (oldIndex, newIndex) {
                      reorderItem(invisibleColumns, oldIndex, newIndex);
                    },
                    children: List.generate(
                      invisibleColumns.length,
                      (index) {
                        return Container(
                          key: ValueKey(invisibleColumns[index]),
                          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(47, 78, 78, 78)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(invisibleColumns[index]),
                            leading: IconButton(
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.pink,
                              onPressed: () {
                                moveEntry(index, false);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showSettingsPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const SettingsPopup();
    },
  );
}