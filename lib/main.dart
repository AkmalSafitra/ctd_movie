import 'package:ctd_movie/pages/home_page.dart';
import 'package:ctd_movie/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'core/color.dart';
import 'mobx/counter.dart';
import 'mobx/movie.dart';

// final CounterMobx counter = CounterMobx();
final MovieMobx movieMobx = MovieMobx();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: blueCT),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MobX Demo'),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Observer(
//                 builder: (context) => Text(
//                       counter.value.toString(),
//                       style: const TextStyle(fontSize: 60),
//                     )),
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FloatingActionButton(
//                   onPressed: () {
//                     counter.increment();
//                   },
//                   child: const Icon(Icons.arrow_upward),
//                 ),
//                 const SizedBox(width: 20),
//                 FloatingActionButton(
//                   onPressed: () {
//                     counter.decrement();
//                   },
//                   child: const Icon(Icons.arrow_downward),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
