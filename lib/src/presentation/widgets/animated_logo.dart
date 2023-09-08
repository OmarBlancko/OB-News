// import 'dart:math' as math;
//
// import 'package:flutter/animation.dart';import 'package:flutter/material.dart';
//
// class FooPageState extends  SingleTickerProviderStateMixin{
//   late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (_, child) {
//             return Transform.rotate(
//               angle: _controller.value * 2 * math.pi,
//               child: child,
//             );
//           },
//           child: FlutterLogo(size: 200),
//         ),
//       ),
//     );
//   }
// }