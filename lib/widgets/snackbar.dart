import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnackbar extends StatelessWidget {
  final BuildContext context;
  final String label;
  final Color backgroundColor;
  final Duration duration;
  final String img;

  const CustomSnackbar({
    Key? key,
    required this.context,
    required this.label,
    required this.backgroundColor ,

    this.duration = const Duration(seconds: 2),
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            flex: 3,
              child: Container(
                color: Colors.transparent,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          label,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(img,color: Colors.white,),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String label,
    required Color color,
    required iconImage,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.05, // Adjust the height as needed
        width: MediaQuery.of(context).size.width,
        child: CustomSnackbar(
          context: context,
          label: label,
          backgroundColor: color,
          duration: duration,
          img: iconImage,
        ),
      ),
    );

    overlay?.insert(overlayEntry);
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

// Usage:
// Call CustomSnackbar.show() with the desired parameters.

// Example:
// CustomSnackbar.show(
//   context: context,
//   label: 'Your text-only snackbar message here',
//   backgroundColor: Colors.blue,
//   duration: Duration(seconds: 3),
// );


class CustomMsgSnackbar extends StatelessWidget {
  final BuildContext context;
  final String label;
  final Color backgroundColor;
  final Duration duration;
  final String img;

  const CustomMsgSnackbar({
    Key? key,
    required this.context,
    required this.label,
    required this.backgroundColor ,

    this.duration = const Duration(seconds: 2),
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    color: Colors.transparent,
                  ),
                ],
              )),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Text(
                                label,
                                maxLines: 4,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset(img,color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 
  static void show({
    required BuildContext context,
    required String label,
    required Color color,
    required iconImage,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.05, // Adjust the height as needed
        width: MediaQuery.of(context).size.width,
        child: CustomMsgSnackbar(
          context: context,
          label: label,
          backgroundColor: color,
          duration: duration,
          img: iconImage,
        ),
      ),
    );

    overlay?.insert(overlayEntry);
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

// Usage:
// Call CustomSnackbar.show() with the desired parameters.

// Example:
// CustomSnackbar.show(
//   context: context,
//   label: 'Your text-only snackbar message here',
//   backgroundColor: Colors.blue,
//   duration: Duration(seconds: 3),
// );
