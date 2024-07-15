import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// LanguageSelectionScreen
class LanguageSelectionScreen extends StatelessWidget {
  //final String title;

  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        //title: Text(title),
        leading: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Done',
              style: TextStyle(color: Color(0xff0073E8)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Translate From',
              style: GoogleFonts.roboto(
                color: const Color(0xff020403),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'Search Language here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            const LanguageList(),
          ],
        ),
      ),
    );
  }
}

// LanguageList Widget
class LanguageList extends StatelessWidget {
  const LanguageList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> recentLanguages = ['English - US', 'French', 'Spanish'];
    final List<String> allLanguages = [
      'Acehnese',
      'Acholi',
      'Afar',
      'Afrikaans',
      'Albanian',
      'Amharic',
    ];

    return Expanded(
      child: ListView(
        children: [
          const SectionHeader(title: 'Recent Languages'),
          for (var language in recentLanguages)
            LanguageItem(language: language),
          const SizedBox(height: 16),
          const SectionHeader(title: 'All Languages'),
          for (var language in allLanguages) LanguageItem(language: language),
        ],
      ),
    );
  }
}

// SectionHeader Widget
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

// LanguageItem Widget
class LanguageItem extends StatelessWidget {
  final String language;

  const LanguageItem({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 52,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(
            color: const Color(0xffEDEDF1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(language),
            ],
          ),
        ),
      ),
    );
    // return ListTile(
    //   title: Text(language),
    //   onTap: () {
    //     Navigator.pop(context, language);
    //   },
    // );
  }
}
