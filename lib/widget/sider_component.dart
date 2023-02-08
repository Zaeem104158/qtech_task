// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:reprecinct/gen/assets.gen.dart';
// import 'package:reprecinct/utils/size_config.dart';
// import 'package:reprecinct/utils/style.dart';
//
// class SliderComponent extends StatelessWidget {
//   const SliderComponent({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Container(
//         height: 98,
//         color: kPrimaryColor,
//         child: Padding(
//           padding: EdgeInsets.only(top: 16.0, left: 16, right: 16, bottom: 0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "1 Bayhaven Place, NSW 6156.",
//                 style: TextStyle(
//                     fontFamily: latoFont,
//                     fontWeight: regularFontWeight,
//                     fontSize: memberNameFontSize,
//                     color: Colors.white),
//               ),
//               Row(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(2.0),
//                     child: Chip(
//                       side: BorderSide(
//                           color: true
//                               ? Color(0xffE7E7EE)
//                               : const Color(0xff00CD74)),
//                       label: Padding(
//                         padding: EdgeInsets.only(
//                             left: 6.0, right: 6, top: 2, bottom: 2),
//                         child: Text(
//                           "Preslisting",
//                           style: TextStyle(
//                               color: true
//                                   ? Color(0xff656A76)
//                                   : const Color(0xff00CD74),
//                               fontFamily: latoFont,
//                               fontWeight: mediumFontWeight,
//                               fontSize: smallestFontSize,
//                               letterSpacing: kSmallerLetterSpacing),
//                         ),
//                       ),
//                       backgroundColor:
//                           true ? Color(0xffF7F7F8) : const Color(0xffE3FFEB),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12),
//                     child: Row(
//                       children: const [
//                         Text(
//                           "Owner: ",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: latoFont,
//                               fontWeight: mediumFontWeight,
//                               fontSize: smallestFontSize,
//                               letterSpacing: kMediumSmallLetterSpacing),
//                         ),
//                         Text(
//                           "Niall",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: latoFont,
//                               fontWeight: regularFontWeight,
//                               fontSize: noDataFoundRegularFontSize,
//                               letterSpacing: kMediumSmallLetterSpacing),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Image(
//             image: const AssetImage("assets/images/campaign_place_holder.png"),
//             color: Colors.black.withOpacity(0.2),
//             colorBlendMode: BlendMode.darken,
//           ),
//           Positioned(
//               top: 30,
//               left: 16,
//               child: SvgPicture.asset(Assets.icons.propertyStatus)),
//           Positioned(
//               top: 30, right: 16, child: SvgPicture.asset(Assets.icons.star))
//         ],
//       )
//     ]);
//   }
// }
