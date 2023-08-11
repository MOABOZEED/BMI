import 'dart:math';
import 'result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;
  double heightVAl = 164.0;
  int weight = 63;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: Row(
                    children: [
                      M1expanded(context, 'male'),
                      const SizedBox(
                        width: 10,
                      ),
                      M1expanded(context, 'Female'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blueGrey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Height",
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          )),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(heightVAl.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline1),
                          const Text("cm",
                              style: TextStyle(fontWeight:FontWeight.w700 ,color:Colors.black ,fontSize: 25)),
                        ],

                      ),
                      Slider(
                          min: 90,
                          max: 220,
                          value: heightVAl,
                          onChanged: (newValue) =>
                              setState(() => heightVAl = newValue))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    M2expanded(context, 'weight'),
                    const SizedBox(
                      width: 15,
                    ),
                    M2expanded(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(

                color: Colors.blue,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 13,
                child: TextButton(
                    onPressed: () {
                      var result = weight / pow(heightVAl / 100, 2);
                      print(result);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Result(result: result, isMale: isMale, age: age)),
                      );
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w800),
                    )))
          ]),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Expanded M1expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: (isMale && type == 'male') || (!isMale && type == 'Female')
                  ? Colors.blue
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'male' ? Icons.male : Icons.female, size: 90),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Expanded M2expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
