import 'package:flutter/material.dart';

class SearchWeatherScreen extends StatefulWidget {
  const SearchWeatherScreen({super.key});

  @override
  State<SearchWeatherScreen> createState() => _SearchWeatherScreenState();
}

class _SearchWeatherScreenState extends State<SearchWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather monitor',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SearchWidget(
                onChanged: (value) {},
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.onChanged,
  });

  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Input city name, zip code,..',
      elevation: MaterialStateProperty.all(1),
      hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
      side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
      trailing: const [Icon(Icons.search_rounded)],
      onChanged: onChanged,
    );
  }
}
