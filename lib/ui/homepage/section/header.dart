import 'package:flutter/material.dart';

import '../../../constant.dart';

class Header extends StatelessWidget {
  final String photo;
  final String name;
  final VoidCallback button;
  const Header({
    Key? key,
    required this.photo,
    required this.name,
    required this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(18),
      color: baseColor,
      width: double.infinity,
      height: size.height / 8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(photo),
            backgroundColor: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo, ' + name + '!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                    text: '2 ',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Task For Today',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: button,
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
