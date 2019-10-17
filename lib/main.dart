import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Carts:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => _buildAboutDialog(context),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}

Widget _buildAboutDialog(BuildContext context) {
  ScrollController scrollController=ScrollController(keepScrollOffset: false,initialScrollOffset: 0);
//  scrollController.
  return CupertinoAlertDialog(
    scrollController: scrollController,
    title: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Text('There are no following items')),
    content: Container(
      height: MediaQuery.of(context).size.height*.6,
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              listTile(),
              listTile(),
              listTile(),
              listTile(),
              listTile(),
              listTile(),
              listTile(),
              listTile(),
//        _buildLogoAttribution(),
            ],
          ),
        ),
      ),
    ),
//      title: const Text('About Pop up'),
//      content: new
    actions: <Widget>[
      Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Change the quantity, try again '),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Delete and Complete the confirm'),
          ),
        ],
      ),
    ],
  );
}

Widget listTile() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/j.jpg',
            width: 70,
          )),
      title: Text('Product'),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.add),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '0',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Icon(Icons.remove),
        ],
      ),
      trailing: InkWell(
        child: Icon(Icons.close),
//        color: Colors.red,
      ),
    ),
  );
}
