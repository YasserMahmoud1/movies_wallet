import 'package:flutter/material.dart';

class SeeMoreView extends StatelessWidget {
  const SeeMoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('See More'),
      ),
      body:  Center(
        child: FilterBar(),
      ),
    );
  }
}

class FilterBar extends StatefulWidget {
  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    // Add more categories here
  ];

  String selectedCategory = '';

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[300],
      child: Row(
        children: categories.map((category) {
          bool isSelected = selectedCategory == category;
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: Chip(
              
              label: Text(category),
              backgroundColor: isSelected ? Colors.blue : null,
              onDeleted: isSelected
                  ? () {
                      selectCategory('');
                    }
                  : null,
              deleteIcon: isSelected ? Icon(Icons.cancel) : null,
              
            ),
          );
        }).toList(),
      ),
    );
  }
}
