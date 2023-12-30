//
// class CustomMsgSnackbar extends StatelessWidget {
//   final BuildContext context;
//   final String label;
//   final Color backgroundColor;
//   final Duration duration;
//   final String img;
//
//   const CustomMsgSnackbar({
//     Key? key,
//     required this.context,
//     required this.label,
//     required this.backgroundColor ,
//
//     this.duration = const Duration(seconds: 2),
//     required this.img,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         margin: EdgeInsets.all(10.0),
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Text(
//                   label,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.0,
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: SvgPicture.asset(img,color: Colors.white,),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   static void show({
//     required BuildContext context,
//     required String label,
//     required Color color,
//     required iconImage,
//     Duration duration = const Duration(seconds: 2),
//   }) {
//     final overlay = Overlay.of(context);
//     final overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         top: MediaQuery.of(context).size.height * 0.05, // Adjust the height as needed
//         width: MediaQuery.of(context).size.width,
//         child: CustomSnackbar(
//           context: context,
//           label: label,
//           backgroundColor: color,
//           duration: duration,
//           img: iconImage,
//         ),
//       ),
//     );
//
//     overlay?.insert(overlayEntry);
//     Future.delayed(duration, () {
//       overlayEntry.remove();
//     });
//   }
// }
