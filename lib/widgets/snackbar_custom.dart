import 'package:flutter/material.dart';

class SnackBarCustom extends StatelessWidget {
  IconData icon = Icons.no_sim_outlined;
  String title = "";
  String message = "";
  SnackBarCustom(this.icon, this.title, this.message);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
