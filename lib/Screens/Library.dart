// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, use_build_context_synchronously, library_private_types_in_public_api, annotate_overrides

import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  @override
  const Library({super.key});
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '🎵 Music'),
            Tab(text: '📹 Video'),
            Tab(text: '📷 Gallery'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "New and Trending",
                        style:
                            TextStyle(fontSize: 20, color: Colors.purple[800]),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: ListView.builder(
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://theharekrishnamovement.files.wordpress.com/2012/11/srila-prabhupada-smiling1.jpg"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Japa With Prabhupada",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        color:
                                                            Colors.deepPurple,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ]),
                                      Icon(
                                        Icons.play_circle,
                                        color: Colors.deepPurple,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Categories",
                        style:
                            TextStyle(fontSize: 20, color: Colors.purple[800]),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.transparent,
                            child: Card(
                              color: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    child: Image.network(
                                        "https://i.pinimg.com/736x/5e/da/02/5eda020093675438a59cf5f777779fbe.jpg"),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 100,
                                    child: Container(
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          'Card Text',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Geners",
                        style:
                            TextStyle(fontSize: 20, color: Colors.purple[800]),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.transparent,
                            child: Card(
                              color: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    child: Image.network(
                                        "https://i.pinimg.com/736x/5e/da/02/5eda020093675438a59cf5f777779fbe.jpg"),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 100,
                                    child: Container(
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          'Card Text',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Artists",
                        style:
                            TextStyle(fontSize: 20, color: Colors.purple[800]),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),
              CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),CircleAvatar(
                radius: 30.0,
                backgroundImage:
                          NetworkImage('https://www.iskconbangalore.org/wp-content/uploads/2020/02/satya-gaura-chandra-dasa.jpg'),
                backgroundColor: Colors.transparent,
              ),SizedBox(width: 10,),
                      ],
                    ),
                  ),
                )
              ],
            ),
            
          ),
          Center(child: Text('Content for Tab 2')),
          Center(child: Text('Content for Tab 3')),
        ],
      ),
    );
  }
}
