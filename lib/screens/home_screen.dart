import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/routes.dart';
import 'package:is_coding_task/strings.dart';
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

  void _toggleDelete() {
    setState(() {
      selectedBikeItems.clear();
      _toggledDelete = !_toggledDelete;
    });
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
    setState(() {
      _toggledDelete = false;
    });
  }

  Widget buildHomeAppBar() {
    return _toggledDelete
        ? AppBar(
            backgroundColor: kDarkGreen,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close, color: Colors.grey[50]),
                onPressed: _toggleDelete,
              ),
            ],
          )
        : AppBar(
            backgroundColor: Colors.grey[50],
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.delete, color: kDarkGreen),
                onPressed: _toggleDelete,
              ),
            ],
          );
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
          appBar: buildHomeAppBar(),
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
                                    onSelect: _toggleSelection,
                                    isSelected: selectedBikeItems
                                        .contains(state.bikes[index]),
                                  )),
                        ),
                        _toggledDelete
                            ? RoundedButton(
                                key: Key("DeleteButton"),
                                label: kDeleteButtonLabel,
                                color: kDeleteButtonColor,
                                onPressed: _delete)
                            : Container(child: null)
                      ],
                    )
                  : Container(
                      child: Text(kNoItemFoundMsg),
                    )),
        );
      } else {
        throw Exception("Invalid state type");
      }
    });
  }
}
