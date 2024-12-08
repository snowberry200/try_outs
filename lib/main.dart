import 'package:flutter/material.dart';
import 'package:try_outs/returncontainer.dart';

void main() {
  runApp(const MyApp());
}

enum SeatState { booked, available }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List listSelected = [];
  List<bool> isSelected = [false, true, false];

  @override
  Widget build(BuildContext context) {
    final List<Map<int, Widget>> retainer = [
      {
        1: ReturnContainer(
          seatState: SeatState.available,
          seat: 1,
          selectedList: listSelected,
          valueSetter: setValue,
        ),
      },
      {
        2: ReturnContainer(
          seatState: SeatState.booked,
          seat: 2,
          selectedList: listSelected,
          valueSetter: setValue,
        )
      }
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView(
            children: retainer.map((containerInfo) {
          containerInfo[1];
          containerInfo[2];
          return ListTile(title: containerInfo[1], subtitle: containerInfo[2]);
        }).toList())

        // Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: ToggleButtons(
        //         isSelected: isSelected,
        //         onPressed: (index) {
        //           for (int i = 0; i < isSelected.length; i++) {
        //             if (i == index) {
        //               setState(() {
        //                 isSelected[i] = true;
        //               });
        //             } else {
        //               setState(() {
        //                 isSelected[i] = false;
        //               });
        //             }
        //           }
        //         },
        //         children: const <Widget>[
        //           Text("for rent"),
        //           Text("for sale"),
        //           Text("for lease")
        //         ],
        //       ),
        //     ),
        //     SizedBox.fromSize(size: const Size(50, 20)),
        //     ReturnContainer(
        //       seatState: SeatState.available,
        //       seat: 1,
        //       selectedList: listSelected,
        //       valueSetter: setValue,
        //     ),
        //     const SizedBox(
        //       height: 30,
        //     ),
        //     ReturnContainer(
        //       seatState: SeatState.booked,
        //       seat: 2,
        //       selectedList: listSelected,
        //       valueSetter: setValue,
        //     )
        //   ],
        // )
        );
  }

  void setValue(seat) {
    if (listSelected.contains(seat)) {
      setState(() {
        listSelected.remove(seat);
      });
    } else {
      setState(() {
        listSelected.add(seat);
      });
    }
  }
}
