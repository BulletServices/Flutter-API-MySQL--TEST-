import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  bool signin = true;

  getMethod() async {
    String URL = 'https://fluttersqlteste.000webhostapp.com/getData.php';
    var res = await http.get(Uri.encodeFull(URL), headers:{"Accept":"application/json"});
    var resBody = json.decode(res.body);
    return resBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API DE SQL'),
      ),
      body: FutureBuilder(
          future: getMethod(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List snap = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao Conectar"),
              );
            }
            return ListView.builder(
              itemCount: snap.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${snap[index]['heading']}"),
                  subtitle: Text("${snap[index]['body']}"),
                );
              },
            );
          }),
    );
  }
}
