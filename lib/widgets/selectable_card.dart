import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';

class SelectableCard extends StatelessWidget {
  SelectableCard(
      {this.showCheckbox,
      this.isSelected,
      this.onSelect,
      this.child,
      this.onTap});

  final bool showCheckbox;
  final bool isSelected;
  final Function() onSelect;
  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Stack(children: <Widget>[
        GestureDetector(
            onTap: showCheckbox ? onSelect : onTap,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: child,
              ),
            )),
        showCheckbox
            ? Align(
                alignment: Alignment.topRight,
                child: Checkbox(
                  checkColor: Colors.grey[50],
                  onChanged: (_value) => onSelect(),
                  activeColor: kSelectedColor,
                  value: isSelected,
                ))
            : Container(child: null)
      ]),
    );
  }
}
