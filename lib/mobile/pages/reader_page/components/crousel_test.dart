// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/shared_components/carousel_slider.dart';
import 'package:scroll_book/state/app_state.dart';
import 'package:scroll_book/state/state.dart';
//https://pub.dev/packages/carousel_slider/example






class VerticalSliderDemo extends StatelessWidget {
  List<int> list = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    var appState = locator<AppState>();
    List<String> blocks = [""];
    appState.getTextBlocks().forEach((b){
      if(blocks.last.length<200)blocks.last+=b;
      else blocks.add(b);
    });
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[200],
          height: s.height,
          child: CarouselSlider(
            options: 
            CarouselOptions(
              //aspectRatio: 1.5,
              viewportFraction: 0.15,
              enlargeCenterPage: false,
               enableInfiniteScroll: false,
              scrollDirection: Axis.vertical,
              autoPlay: true,
            ),
            items:blocks
            // .map((item) => 
            // Container(
            //   child: Padding(
            //     padding:  EdgeInsets.all(25.0),
            //     child: Center(
            //       child: Text(item.toString(), style: appState.getFontStyle(),)
            //     ),
            //   ),
            //   color: Colors.grey[100],
            // )
            // ).toList(),
          )
        ),
      ),
    );
  }
}

// class DemoItem extends StatelessWidget {
//   final String title;
//   final String route;
//   DemoItem(this.title, this.route);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title),
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//     );
//   }
// }


// class BasicDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<int> list = [1,2,3,4,5];
//     return Scaffold(
//       appBar: AppBar(title: Text('Basic demo')),
//       body: Container(
//         child: CarouselSlider(
//           options: CarouselOptions(),
//           items: list.map((item) => Container(
//             child: Center(
//               child: Text(item.toString())
//             ),
//             color: Colors.green,
//           )).toList(),
//         )
//       ),
//     );
//   }
// }




// class ManuallyControlledSlider extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ManuallyControlledSliderState();
//   }
// }

// class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
//   final CarouselController _controller = CarouselController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<int> list = [1,2,3,4,5];
//     return Scaffold(
//       appBar: AppBar(title: Text('Manually controlled slider')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             CarouselSlider(
//               items: list.map((item) => Container(
//             child: Center(
//               child: Text(item.toString())
//             ),
//             color: Colors.green,
//           )).toList(),
//               options: CarouselOptions(enlargeCenterPage: true, height: 200),
//               carouselController: _controller,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Flexible(
//                   child: RaisedButton(
//                     onPressed: () => _controller.previousPage(),
//                     child: Text('←'),
//                   ),
//                 ),
//                 Flexible(
//                   child: RaisedButton(
//                     onPressed: () => _controller.nextPage(),
//                     child: Text('→'),
//                   ),
//                 ),
//                 ...Iterable<int>.generate(list.length).map(
//                   (int pageIndex) => Flexible(
//                     child: RaisedButton(
//                       onPressed: () => _controller.animateToPage(pageIndex),
//                       child: Text("$pageIndex"),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       )
//     );
//   }
// }
