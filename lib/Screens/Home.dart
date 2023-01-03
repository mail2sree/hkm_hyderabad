// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, use_build_context_synchronously, sort_child_properties_last, avoid_unnecessary_containers, unused_field, unused_element, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_share/flutter_share.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DocumentSnapshot>? _items;
  Key _widgetKey = UniqueKey();

  void _restartWidget() {
    setState(() {
      _widgetKey = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
    // Get a reference to the "Feeds" collection in Firestore
    FirebaseFirestore.instance.collection("Feeds").get().then((querySnapshot) {
      // Create a list of Feeds from the query snapshot
      _items = querySnapshot.docs;
      // Set the state to trigger a rebuild of the widget
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("HKM Hyderabad"),
          automaticallyImplyLeading: false,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Display a different layout for large screens
              return LargeScreenLayout();
            } else {
              // Display a different layout for small screens
              return SmallScreenLayout();
            }
          },
        ),
      ),
    );
  }
}

class LargeScreenLayout extends StatefulWidget {
  const LargeScreenLayout({super.key});

  @override
  State<LargeScreenLayout> createState() => _LargeScreenLayoutState();
}

class _LargeScreenLayoutState extends State<LargeScreenLayout> {
  List<DocumentSnapshot>? _items;
  Key _widgetKey = UniqueKey();

  void _restartWidget() {
    setState(() {
      _widgetKey = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
    // Get a reference to the "Feeds" collection in Firestore
    FirebaseFirestore.instance.collection("Feeds").get().then((querySnapshot) {
      // Create a list of Feeds from the query snapshot
      _items = querySnapshot.docs;
      // Set the state to trigger a rebuild of the widget
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        children: List.generate(_items?.length ?? 3, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(children: [
                Column(
                  children: [
                    Container(
                      child: ClipRRect(
                          child: Image.network(
                            "${_items?[index]["Image-Url"] ?? "https://upload.wikimedia.org/wikipedia/commons/b/b1/Loading_icon.gif?20151024034921"}",
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          )),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Align(
                              child: Text(
                                "  ${_items?[index]['Title'] ?? ""}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              child: Text(
                                "  ${_items?[index]['Date'] ?? ""}",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  child: Text(
                                    "  ${_items?[index]["Flower_Offered"] ?? ""} Flowers Offered",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                                Align(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          FirebaseFirestore.instance
                                              .collection('Feeds')
                                              .doc('${_items?[index].id}')
                                              .update({
                                            'Flower_Offered': _items?[index]
                                                    ["Flower_Offered"] +
                                                1
                                          });

                                          FirebaseFirestore.instance
                                              .collection("Feeds")
                                              .get()
                                              .then((querySnapshot) {
                                            // Create a list of Feeds from the query snapshot
                                            _items = querySnapshot.docs;
                                            // Set the state to trigger a rebuild of the widget
                                            setState(() {});
                                          });
                                        },
                                        child: Image.asset(
                                          "assets/Lotus.png",
                                          height: 40,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Icon(Icons.share),
                                        onTap: () async {
                                          // Define the content you want to share
                                          String title =
                                              "${_items?[index]["Title"]}";
                                          String text =
                                              'This is today\'s ${title} from Hare Krishna Golden Temple';
                                          String filePath =
                                              '${_items?[index]["Image-Url"]}';
                                          // Use the share plugin to share the image
                                          await FlutterShare.share(
                                            title: title,
                                            text: text,
                                            linkUrl: filePath,
                                            chooserTitle: 'Share',
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.topLeft,
                                )
                              ],
                            )
                          ]),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
            ),
          );
        }));
  }
}

class SmallScreenLayout extends StatefulWidget {
  const SmallScreenLayout({super.key});

  @override
  State<SmallScreenLayout> createState() => _SmallScreenLayoutState();
}

class _SmallScreenLayoutState extends State<SmallScreenLayout> {
  List<DocumentSnapshot>? _items;
  Key _widgetKey = UniqueKey();

  void _restartWidget() {
    setState(() {
      _widgetKey = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
    // Get a reference to the "Feeds" collection in Firestore
    FirebaseFirestore.instance.collection("Feeds").get().then((querySnapshot) {
      // Create a list of Feeds from the query snapshot
      _items = querySnapshot.docs;
      // Set the state to trigger a rebuild of the widget
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(children: [
              Column(
                children: [
                  Container(
                    child: ClipRRect(
                        child: Image.network(
                            "${_items?[index]["Image-Url"] ?? "https://upload.wikimedia.org/wikipedia/commons/b/b1/Loading_icon.gif?20151024034921"}",
                            height: 265),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )),
                  ),
                  Container(
                      width: 400,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Align(
                                  child: Text(
                                    "${_items?[index]['Title'] ?? ""}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  child: Text(
                                    "${_items?[index]['Date'] ?? ""}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                child: Text(
                                  "  ${_items?[index]["Flower_Offered"] ?? ""} Flowers Offered",
                                  style: TextStyle(fontSize: 17),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                              Align(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        FirebaseFirestore.instance
                                            .collection('Feeds')
                                            .doc('${_items?[index].id}')
                                            .update({
                                          'Flower_Offered': _items?[index]
                                                  ["Flower_Offered"] +
                                              1
                                        });

                                        FirebaseFirestore.instance
                                            .collection("Feeds")
                                            .get()
                                            .then((querySnapshot) {
                                          // Create a list of Feeds from the query snapshot
                                          _items = querySnapshot.docs;
                                          // Set the state to trigger a rebuild of the widget
                                          setState(() {});
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/Lotus.png",
                                        height: 40,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Icon(Icons.share),
                                      onTap: () async {
                                        // Define the content you want to share
                                        String title =
                                            "${_items?[index]["Title"]}";
                                        String text =
                                            'This is today\'s ${title} from Hare Krishna Golden Temple';
                                        String filePath =
                                            '${_items?[index]["Image-Url"]}';
                                        // Use the share plugin to share the image
                                        await FlutterShare.share(
                                          title: title,
                                          text: text,
                                          linkUrl: filePath,
                                          chooserTitle: 'Share',
                                        );
                                      },
                                    )
                                  ],
                                ),
                                alignment: Alignment.topLeft,
                              )
                            ],
                          )
                        ]),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        );
      },
    );
  }
}
