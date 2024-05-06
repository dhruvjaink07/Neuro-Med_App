import 'package:flutter/material.dart';

class SpeechBubble extends StatelessWidget {
  final String text;
  final Color color;

  const SpeechBubble({super.key, this.text = '', this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SpeechBubblePainter(text: text, color: color),
    );
  }
}

class SpeechBubblePainter extends CustomPainter {
  final String text;
  final Color color;

  const SpeechBubblePainter({required this.text, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..style = PaintingStyle.fill;
    final path = Path();

    path.moveTo(0, size.height * 0.2); // Top left corner
    path.quadraticBezierTo(0, 0, size.width * 0.1, 0); // Top left rounded corner
    path.lineTo(size.width * 0.9, 0); // Top right line
    path.quadraticBezierTo(size.width, 0, size.width, size.height * 0.2); // Top right rounded corner
    path.lineTo(size.width, size.height); // Right side line
    path.quadraticBezierTo(size.width, size.height * 0.8, size.width * 0.8, size.height); // Bottom right rounded corner
    path.lineTo(size.width * 0.2, size.height); // Bottom line
    path.quadraticBezierTo(0, size.height, 0, size.height * 0.8); // Bottom left rounded corner
    path.close();

    canvas.drawPath(path, paint);

    // Draw the text if provided
    if (text.isNotEmpty) {
      final textPainter = TextPainter(
          text: TextSpan(text: text, style: TextStyle(color: Colors.white)),
          maxLines: 2,
          // ellipsis: ,
          textDirection: TextDirection.ltr);
      textPainter.layout(minWidth: 0, maxWidth: size.width * 0.8);
      textPainter.paint(canvas, Offset(size.width * 0.1, size.height * 0.1));
    }
  }

  @override
  bool shouldRepaint(SpeechBubblePainter oldDelegate) => color != oldDelegate.color || text != oldDelegate.text;
}