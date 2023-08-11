import 'package:flutter/material.dart';

import '../../../../../manager.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SearchField(),
                ),
                SizedBox(width: 24),
                Expanded(
                  flex: 1,
                  child: DropDown(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: "Search keyword",
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({
    super.key,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String _dropdownValue = "Multi";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.lightBlacks.withOpacity(.5),
          borderRadius: BorderRadius.circular(16)),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            borderRadius: BorderRadius.circular(16),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            dropdownColor: ColorManager.lightBlacks,
            items: const [
              DropdownMenuItem(
                value: "Multi",
                child: Text("Multi"),
              ),
              DropdownMenuItem(
                value: "Multi1",
                child: Text("Multi1"),
              ),
              DropdownMenuItem(
                value: "Multi2",
                child: Text("Multi2"),
              ),
              DropdownMenuItem(
                value: "Multi3",
                child: Text("Multi3"),
              ),
            ],
            value: _dropdownValue,
            onChanged: (value) {
              setState(() {
                _dropdownValue = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
