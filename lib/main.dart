import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sql_conn/sql_conn.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Test",
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Future<void> connect(BuildContext ctx) async {
    debugPrint("Connecting...");
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("LOADING"),
            content: CircularProgressIndicator(),
          );
        },
      );
      await SqlConn.connect(
          ip: "192.168.0.128",
          port: "1433",
          databaseName: "devi",
          username: "thirumoorthi vanakkam da maapla",
          password: "@thiru9877");
      debugPrint("Connected!");
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      Navigator.pop(context);
    }
  }

  Future<void> read(String query) async {
    var res = await SqlConn.readData(query);
    debugPrint(res.toString());
  }

  Future<void> write(String query) async {
    var res = await SqlConn.writeData(query);
    debugPrint(res.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => connect(context),
                  child: const Text("Connect")),
              ElevatedButton(
                  onPressed: () => read("SELECT * FROM devi"),
                  child: const Text("Read")),
              ElevatedButton(
                  onPressed: () => write("DELETE FROM devi WHERE class='c'"),
                  child: const Text("delete data")),
              ElevatedButton(
                  onPressed: () => write(
                      "CREATE TABLE thirumoorthi (PersonID int, LastName varchar(255), FirstName varchar(255), Address varchar(255),City varchar(255))"),
                  child: const Text("Create Table")),
              ElevatedButton(onPressed:()=> write("insert into thirumoorthi values(102"
                  ""
                  ",'vinstin','ka','chennai','chennai')"), child: const Text("insert") ),
              ElevatedButton(
                  onPressed: () => write(
                      "DROP TABLE thirumoorthi"),
                  child: const Text("Delete Table")),
              ElevatedButton(
                  onPressed: () => SqlConn.disconnect(),
                  child: const Text("Disconnect")),
              ElevatedButton(onPressed: ()=>write('bcp "SELECT * FROM devi..thirumoorthi" queryout /storage/emulated/0/Downloads/thiru.csv -c -t "," -T -S DESKTOP-7MJ6HCS/SQLEXPRESS'), child: const Text("Download"))
            ],
          ),
        ));
  }
}
