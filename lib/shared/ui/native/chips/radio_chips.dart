import 'package:flutter/material.dart';

class RadioChips<T> extends StatefulWidget {
  const RadioChips(
      {super.key,
      required this.items,
      required this.onSelected,
      this.initialIndex = 0});

  final List<T> items;
  final Function(int i, T value) onSelected;
  final int initialIndex;

  @override
  State<RadioChips> createState() => _RadioChipsState();
}

class _RadioChipsState extends State<RadioChips> {
  late String selectedText;

  @override
  void initState() {
    super.initState();

    selectedText = isString()
        ? widget.items[widget.initialIndex]
        : widget.items[widget.initialIndex].name;
  }

  bool isString() {
    return widget.items[0] is String;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 5,
      children: widget.items
          .map((e) => ChoiceChip(
                label: Text(e),
                avatar: _avatar(),
                selected:
                    isString() ? e == selectedText : e.name == selectedText,
                onSelected: (val) {
                  if (!val) return;
                  setState(() {
                    selectedText = isString() ? e : e.name;
                  });
                  widget.onSelected(widget.items.indexOf(e), e);
                },
              ))
          .toList(),
    );
  }

  Widget? _avatar() {
    if (isString()) return null;
    if (widget.items[widget.initialIndex].image != null) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset(widget.items[widget.initialIndex].image),
      );
    }
    if (widget.items[widget.initialIndex].icon != null) {
      return Icon(
        widget.items[widget.initialIndex].icon,
      );
    }
    return null;
  }
}
