import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/routes.dart';
import 'package:is_coding_task/widgets/bike_item_card.dart';
import 'package:is_coding_task/widgets/center_indicator.dart';
import 'package:is_coding_task/widgets/rounded_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _toggledDelete = false;
  List<BikeItem> selectedBikeItems = [];

  void _toggleDelete(bool toggled) {
    if (toggled) {
      setState(() {
        _toggledDelete = false;
      });
    } else {
      setState(() {
        _toggledDelete = true;
      });
    }
  }

  void _toggleSelection(BikeItem bikeItem) {
    setState(() {
      if (selectedBikeItems.contains(bikeItem)) {
        selectedBikeItems.remove(bikeItem);
      } else {
        selectedBikeItems.add(bikeItem);
      }
    });
  }

  void _delete() {
    BlocProvider.of<BikeShopBloc>(context)
        .add(DeleteBikeItem(selectedBikeItems));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BikeShopBloc, BikeShopState>(builder: (context, state) {
      if (state is BikeShopLoading) {
        return CenterIndicator();
      } else if (state is BikeShopLoaded) {
        return Scaffold(
          floatingActionButton: _toggledDelete
              ? Container(child: null)
              : FloatingActionButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.addBikeItem),
                  child: Icon(Icons.add),
                ),
          appBar: AppBar(
            backgroundColor: _toggledDelete ? kDarkGreen : Colors.grey[50],
            actions: <Widget>[
              IconButton(
                icon: Icon(_toggledDelete ? Icons.close : Icons.delete,
                    color: _toggledDelete ? Colors.grey[50] : kDarkGreen),
                onPressed: () => _toggleDelete(_toggledDelete),
              ),
            ],
          ),
          body: Center(
              child: state.bikes.length > 0
                  ? Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.bikes.length,
                              itemBuilder: (context, index) => BikeItemCard(
                                    bikeItem: state.bikes[index],
                                    showCheckbox: _toggledDelete,
                                    onSelect: (selected) {
                                      _toggleSelection(state.bikes[index]);
                                    },
                                    isSelected: selectedBikeItems
                                        .contains(state.bikes[index]),
                                  )),
                        ),
                        _toggledDelete
                            ? RoundedButton(
                                key: Key("DeleteButton"),
                                label: "Delete",
                                onPressed: _delete)
                            : Container(child: null)
                      ],
                    )
                  : Container(
                      child: Text("No item found. Please add item"),
                    )),
        );
      } else {
        throw Exception("Invalid state type");
      }
    });
  }
}
