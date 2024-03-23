import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(children: [
          TextSpan(
              text: "Wallpaer",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: " Guru",
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 20))
        ]),
      ),
    );
  }
}
