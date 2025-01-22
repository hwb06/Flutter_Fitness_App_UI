import 'package:flutter/material.dart';

class FlowNavBarWidget extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final VoidCallback onNextPressed;

  const FlowNavBarWidget({
    Key? key,
    this.onBackPressed,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add space between items
      children: [
        // Back Button
        if (onBackPressed != null)
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            ),
          ),
        // Next Button
        Container(
          height: 48,
          width: 120,
          decoration: BoxDecoration(
            color: onNextPressed != null ? const Color(0xFF97FF82) : Colors.grey[300],
            borderRadius: BorderRadius.circular(24),
          ),
          child: MaterialButton(
            onPressed: onNextPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
