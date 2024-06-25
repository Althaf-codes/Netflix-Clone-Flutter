import 'package:flutter/material.dart';

Widget horizontalFullIconButton({
  required BuildContext context,
  required IconData iconData,
  required String label,
  required Color bgColor,
  required Color labelColor,
  required Color iconColor,
  required FontWeight fontweight,
  required VoidCallback ontap,
}) {
  return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: bgColor,
          minimumSize: Size(MediaQuery.of(context).size.width, 30)),
      onPressed: ontap,
      icon: Icon(
        iconData,
        color: iconColor,
      ),
      label: Text(
        label,
        style:
            TextStyle(color: labelColor, fontSize: 15, fontWeight: fontweight),
      ));
}

// class HorizontalFullIconButton extends StatelessWidget {
//   IconData iconData;
//   String label;
//   Color bgColor;
//   HorizontalFullIconButton({
//     Key? key,
//     required this.iconData,
//     required this.label,
//     required this.bgColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//         style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.all(12),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//             backgroundColor: bgColor,
//             minimumSize: Size(MediaQuery.of(context).size.width, 30)),
//         onPressed: () {},
//         icon: Icon(
//           iconData,
//           color: AppColor.black,
//         ),
//         label: Text(
//           label,
//           style: TextStyle(
//               color: AppColor.black, fontSize: 15, fontWeight: FontWeight.w600),
//         ));
//   }
// }