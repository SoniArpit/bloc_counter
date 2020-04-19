import 'package:bloc_counter/CounterEvent.dart';
import 'package:flutter/material.dart';
import 'CounterBloc.dart';
import 'CounterEvent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterBloc _counterBloc = CounterBloc();

  var countData;
  @override
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Counter App BLoC"),
      ),
      body: StreamBuilder(
        stream: _counterBloc.counterStream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: Center(child: Text("${snapshot.data}")),
          );
        },
      ),
      floatingActionButton: (Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
                _counterBloc.counterIncrementSink.add(CounterIncrementEvent()),
            child: Icon(Icons.add),
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          FloatingActionButton(
            onPressed: () =>
                _counterBloc.counterIncrementSink.add(CounterDecrementEvent()),
            child: Icon(Icons.remove),
          ),
        ],
      )),
    );
    return scaffold;
  }

  void dispose() {
    // TODO: implement dispose
    _counterBloc.dispose();
    super.dispose();
  }
}
