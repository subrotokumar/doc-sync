import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.onTap, required this.icon, this.col});
  final Color? col;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 30,
      child: IconButton(
        style: IconButton.styleFrom(
          fixedSize: const Size(30, 30),
          backgroundColor: col ?? Colors.blue.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
