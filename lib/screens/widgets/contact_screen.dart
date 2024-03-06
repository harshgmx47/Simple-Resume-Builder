import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.0040, horizontal: size.width * 0.02),
        child: Row(
          children: [
            /// Empty Space
            SizedBox(
              width: size.width * 0.001,
            ),

            /// Icon
            Icon(
              icon,
              color: theme.canvasColor,
              size: 20,
            ),

            /// Empty Space
            SizedBox(
              width: size.width * 0.1,
            ),

            /// title
            Text(
              title,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
