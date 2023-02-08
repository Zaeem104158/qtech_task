// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../utils/asset_const.dart';

// class ImageViewComponent extends StatelessWidget {
//   final double? width;
//   final double imageRadius;
//   final BoxFit? boxFit;
//   final double? height;
//   final String? imageUrl;
//   final bool isLocalAsset;
//   final bool isLocalAssetSvg;
//   final bool isNetworkAssetSvg;
//   final Color? borderColor;
//   final double borderWidth;
//   final String placeHolderIcon;
//   final Color backgroundColor;
//   final double backgroundRadius;
//   final double backgroundColorOpacity;
//   final Color? isLocalAssetSvgColor;
//   final VoidCallback? onPressed;

//   const ImageViewComponent({
//     Key? key,
//     required this.imageUrl,
//     this.borderColor,
//     this.onPressed,
//     this.width = 100,
//     this.height = 100,
//     this.imageRadius = 100.0,
//     this.borderWidth = 2.5,
//     this.boxFit = BoxFit.cover,
//     this.isLocalAsset = false,
//     this.isLocalAssetSvg = false,
//     this.isNetworkAssetSvg = false,
//     this.backgroundRadius = 100,
//     this.placeHolderIcon = userPlaceholderAsset,
//     this.backgroundColor = Colors.transparent,
//     this.backgroundColorOpacity = 0.0,
//     this.isLocalAssetSvgColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return onPressed != null
//         ? GestureDetector(
//             child: _getImageViewWidget(),
//             onTap: onPressed,
//           )
//         : _getImageViewWidget();
//   }

//   Widget _getImageViewWidget() {
//     return Container(
//       height: height,
//       width: width,
//       decoration: borderColor != null
//           ? BoxDecoration(
//               color: backgroundColor.withOpacity(backgroundColorOpacity),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(backgroundRadius),
//               ),
//               border: Border.all(
//                 color: borderColor!,
//                 width: borderWidth,
//               ),
//             )
//           : null,
//       child: ClipRRect(
//         borderRadius: BorderRadius.all(
//           Radius.circular(imageRadius),
//         ),
//         child: _loadImage(),
//       ),
//     );
//   }

//   Widget _loadImage() {
//     if (isLocalAsset) {
//       return FadeInImage(
//         placeholder: AssetImage(placeHolderIcon),
//         fit: boxFit,
//         image: AssetImage(
//           imageUrl ?? placeHolderIcon,
//         ),
//       );
//     } else if (isLocalAssetSvg) {
//       return SvgPicture.asset(
//         imageUrl ?? placeHolderIcon,
//         color: isLocalAssetSvgColor,
//         fit: BoxFit.fill,
//       );
//     } else {
//       if (isNetworkAssetSvg) {
//         return SvgPicture.network(
//           imageUrl ?? placeHolderIcon,
//         );
//       } else {
//         return CachedNetworkImage(
//           imageUrl: imageUrl ?? placeHolderIcon,
//           fit: boxFit,
//           placeholder: (context, url) => Image.asset(placeHolderIcon),
//           errorWidget: (context, url, error) => Image.asset(placeHolderIcon),
//         );
//       }
//     }
//   }
// }
