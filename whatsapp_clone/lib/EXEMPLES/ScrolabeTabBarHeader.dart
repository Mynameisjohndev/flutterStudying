import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late TabController _tabBarController;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      } else {
        print(user);
      }
    });
    _tabBarController = TabController(
      length: 6,
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
            centerTitle: true,
            leading: Icon(Icons.person_outline),
            title: Text('DASHBOARD',style: TextStyle(fontSize: 16.0),),
            bottom: PreferredSize(
                child: TabBar(
                  controller: _tabBarController,
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text('Tab 1'),
                      ),
                      Tab(
                        child: Text('Investment'),
                      ),
                      Tab(
                        child: Text('Your Earning'),
                      ),
                      Tab(
                        child: Text('Current Balance'),
                      ),
                      Tab(
                        child: Text('Tab 5'),
                      ),
                      Tab(
                        child: Text('Tab 6'),
                      )
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.add_alert),
              ),
            ],
          ),
          body: TabBarView(
            controller: _tabBarController,
            children: <Widget>[
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 3'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 4'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 5'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 6'),
                ),
              ),
            ],
          ),
      // appBar:
      //     AppBar(
      //       title: Text("WhatsApp"), 
      //       backgroundColor: Color(0xff075E54),
      //       bottom: TabBar(
      //         indicatorWeight: 4,
      //         labelStyle: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold
      //         ),
      //         controller: _tabBarController,
      //         indicatorColor: Colors.white,
      //         tabs: <Widget>[
      //           Tab(text: "Conversas",),
      //           Tab(text: "Contatos",),
      //         ]
      //       ),
      //     ),
      // body: TabBarView(
      //   controller: _tabBarController,
      //   children: <Widget>[
      //     Text("Conversas"),
      //     Text("Contato"),
      //   ],
      // ),
    );
  }
}
