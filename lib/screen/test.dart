import 'package:flutter/material.dart';

class MySearchPage extends StatefulWidget {
  @override
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  bool _isSearchVisible = false;
  TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        // Clear the search text and close the keyboard when hiding the search field.
        _searchController.clear();
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        title: _isSearchVisible
            ? TextFormField(
                controller: _searchController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  label: Text("Email"),
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              )
            : Text(''),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: Center(
        child: Text('Contents of the app go here.'),
      ),
    );
  }
}
