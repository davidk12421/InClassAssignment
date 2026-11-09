import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Adder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller_1, _controller_2;
  var _total = "";

  @override
  void initState() {
    super.initState();
    _controller_1 = TextEditingController();
    _controller_2 = TextEditingController();
  }

  @override
  void dispose() {
    _controller_1.dispose();
    _controller_2.dispose();
    super.dispose();
  }


  void _calculateTotal() {
    setState(() {
      try {
        var num1 = int.parse(_controller_1.text);
        var num2 = int.parse(_controller_2.text);
        var sum = num1 + num2;
        _total = sum.toString();
      } catch (e) {
        _total = "Invalid Input";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Expanded (
              flex : 1,
              child: Text(
                'Enter two numbers to calculate their sum',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Expanded (
              flex : 2,
              child: TextField(controller: _controller_1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded (
              flex : 2,
              child: TextField(controller: _controller_2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Expanded (
              flex : 2,
              child: IconButton(
                onPressed: _calculateTotal,
                icon: Icon(Icons.add_circle, size: 50),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            ),

            Expanded(
              flex : 4,
              child: Text( 'Result = $_total' ,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),

    );
  }
}
