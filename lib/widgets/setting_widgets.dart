import 'package:flutter/material.dart';

class ProfileSettingWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  const ProfileSettingWidget(
      {super.key, required this.text,  this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
