import 'package:flutter/material.dart';
import 'package:reqres_http/post_result_model.dart';
import 'package:reqres_http/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User user = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan Req_Res'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                postResult != null
                    ? postResult.id +
                        ' | ' +
                        postResult.name +
                        ' | ' +
                        postResult.job +
                        ' | ' +
                        postResult.created
                    : 'Tidak ada data',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI('Khoirul', 'IT Support')
                      .then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text('POST'),
              ),
              Divider(
                thickness: 1,
              ),
              Text(
                user != null ? user.id + ' | ' + user.name : 'Tidak ada data',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  User.connectToAPI('2').then((value) {
                    user = value;
                    setState(() {});
                  });
                },
                child: Text('GET'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
