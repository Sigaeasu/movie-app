import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/components/components.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
