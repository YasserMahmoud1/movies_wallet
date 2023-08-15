import 'package:flutter/material.dart';
import 'package:movies_wallet/manager.dart';

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
            child: SearchField(),
          ),
          Segment(),
        ],
      ),
    );
  }
}

class Segment extends StatefulWidget {
  const Segment({
    super.key,
  });

  @override
  State<Segment> createState() => _SegmentState();
}

class _SegmentState extends State<Segment> {
  String selectedSegment = "Movies";

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return ColorManager.blues;
            }
            return Colors.transparent;
          },
        ),
        side: MaterialStateProperty.all(
            const BorderSide(color: ColorManager.lightBlacks, width: 2)),
      ),
      segments: const [
        ButtonSegment(
          label: Text("Movies"),
          value: "Movies",
        ),
        ButtonSegment(
          label: Text("Person"),
          value: "Person",
        ),
      ],
      selected: {selectedSegment},
      onSelectionChanged: (value) {
        setState(() {
          selectedSegment = value.first;
        });
      },
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
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: "Search keyword",
        suffixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: ColorManager.whites,
            ),
            onPressed: () {}),
      ),
    );
  }
}
