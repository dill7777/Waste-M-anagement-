// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'package:trashbuddy/PROVIDER/mainprovider.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dual Slider with Provider'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer<mainProvider>(
//               builder: (context, rangeSliderProvider, child) {
//                 return SfRangeSlider(
//                   values: rangeSliderProvider.rangeValues,
//                   min: 0.0,
//                   max: 100.0,
//                   showLabels: true,
//                   interval: 20,
//                   showTicks: true,
//                   numberFormat: NumberFormat('\$'),
//                   enableTooltip: true,
//                   onChanged: (SfRangeValues newValues) {
//                     rangeSliderProvider.setRangeValues(newValues);
//                   },
//                 );
//               },
//             ),
//             Consumer<mainProvider>(
//               builder: (context, rangeSliderProvider, child) {
//                 return Text(
//                   'Range: \$${rangeSliderProvider.rangeValues.start.toStringAsFixed(1)} - \$${rangeSliderProvider.rangeValues.end.toStringAsFixed(1)}',
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }