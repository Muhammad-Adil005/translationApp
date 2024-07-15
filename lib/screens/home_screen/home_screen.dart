import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/translator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final translator = GoogleTranslator();
  String _translatedText = '';
  String _originalText = '';
  List<Map<String, dynamic>> _languages = [];
  Map<String, dynamic>? _selectedFromLanguage;
  Map<String, dynamic>? _selectedToLanguage;

  @override
  void initState() {
    super.initState();
    _loadLanguages();
  }

  Future<void> _loadLanguages() async {
    final String response =
        await rootBundle.loadString('lib/assets/jsons/languages.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      _languages = data.map((e) => e as Map<String, dynamic>).toList();
      _selectedFromLanguage = _languages.first;
      _selectedToLanguage = _languages[1];
    });
  }

  void _translateText(String text) async {
    if (_selectedFromLanguage == null || _selectedToLanguage == null) return;
    final translation = await translator.translate(
      text,
      from: _selectedFromLanguage!['code'],
      to: _selectedToLanguage!['code'],
    );
    setState(() {
      _originalText = text;
      _translatedText = translation.text;
    });
  }

  void _swapLanguages() {
    setState(() {
      final temp = _selectedFromLanguage;
      _selectedFromLanguage = _selectedToLanguage;
      _selectedToLanguage = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: const Icon(Icons.ac_unit),
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Text(
                'Instant',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'Translator',
                style: GoogleFonts.roboto(
                  color: const Color(0xff434343),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child:
                          _buildLanguageDropdown('From', _selectedFromLanguage,
                              (Map<String, dynamic>? newValue) {
                        setState(() {
                          _selectedFromLanguage = newValue;
                        });
                      }),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.swap_horiz_outlined,
                        color: Color(0xff0073E8),
                      ),
                      onPressed: _swapLanguages,
                    ),
                    Expanded(
                      child: _buildLanguageDropdown('To', _selectedToLanguage,
                          (Map<String, dynamic>? newValue) {
                        setState(() {
                          _selectedToLanguage = newValue;
                        });
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextEntryCard(onTranslate: _translateText),
              ],
            ),
          ),
          if (_translatedText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: TranslationCard(
                original: _originalText,
                translated: _translatedText,
                languagePair:
                    '${_selectedFromLanguage!['language']} - ${_selectedToLanguage!['language']}',
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // This will show both label and icon at the BottomNavigationBar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Convo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
        selectedItemColor: const Color(0xff0073E8),
        unselectedItemColor: const Color(0xff73767B),
        onTap: (index) {},
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: const Color(0xff0073E8),
        onPressed: () {},
        child: const Icon(Icons.mic_none, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildLanguageDropdown(String label, Map<String, dynamic>? selected,
      ValueChanged<Map<String, dynamic>?> onChanged) {
    return DropdownButton<Map<String, dynamic>>(
      isExpanded: true,
      value: selected,
      onChanged: onChanged,
      items: _languages.map<DropdownMenuItem<Map<String, dynamic>>>(
          (Map<String, dynamic> value) {
        return DropdownMenuItem<Map<String, dynamic>>(
          value: value,
          child: Row(
            children: [
              Text(value['flag']),
              const SizedBox(width: 8),
              Text(
                value['language'],
                //overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class TextEntryCard extends StatelessWidget {
  final Function(String) onTranslate;

  const TextEntryCard({super.key, required this.onTranslate});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Container(
      height: 250,
      width: double.infinity,
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
                onTranslate(_controller.text);
              },
              child: const Text('Translate'),
            ),
          ],
        ),
      ),
    );
  }
}

class TranslationCard extends StatelessWidget {
  final String original;
  final String translated;
  final String languagePair;

  const TranslationCard(
      {super.key,
      required this.original,
      required this.translated,
      required this.languagePair});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffEDEDF1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languagePair,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Original: $original',
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: const Color(0xff7B7B7B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Translated: $translated',
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: const Color(0xff0073E8),
            ),
          ),
        ],
      ),
    );
  }
}
