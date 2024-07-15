import 'package:flutter/material.dart';

class TextEntryCard extends StatefulWidget {
  final Function(String) onTranslate;

  const TextEntryCard({super.key, required this.onTranslate});

  @override
  _TextEntryCardState createState() => _TextEntryCardState();
}

class _TextEntryCardState extends State<TextEntryCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffEDEDF1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: 'Enter texts here...',
                  border: InputBorder.none,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.onTranslate(_controller.text);
              },
              child: const Text('Translate'),
            ),
          ],
        ),
      ),
    );
  }
}
