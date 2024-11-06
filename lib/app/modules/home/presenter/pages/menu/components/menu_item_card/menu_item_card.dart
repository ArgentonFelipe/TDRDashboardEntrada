import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

class MenuItemCard extends StatelessWidget {
  final String label;
  final String description;
  final VoidCallback onPressed;

  const MenuItemCard({
    super.key,
    required this.label,
    required this.onPressed,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: this.onPressed,
        child: SizedBox(
          width: 350,
          height: 350,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        this.label,
                        style: TextStyleApp.title.copyWith(
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(),
                    ],
                  ),
                  Text(
                    this.description,
                    style: TextStyleApp.body.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
