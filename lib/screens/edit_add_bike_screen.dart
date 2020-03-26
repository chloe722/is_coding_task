import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/size_config.dart';
import 'package:is_coding_task/strings.dart';
import 'package:is_coding_task/widgets/spacer.dart';

class EditAddScreen extends StatefulWidget {
  EditAddScreen({this.bikeItem, this.isEditing = false, this.onSave});

  final BikeItem bikeItem;
  final bool isEditing;
  final VoidCallback onSave;

  @override
  _EditAddScreenState createState() => _EditAddScreenState();
}

class _EditAddScreenState extends State<EditAddScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get _isEditing => widget.isEditing;

  String _bikeName;
  String _category;
  String _location;

  void onSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("$_bikeName $_category $_location");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            onSave();
          },
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              children: <Widget>[
                CachedNetworkImage(
                    imageUrl: bikePlaceHolderImage,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    fit: BoxFit.contain,
                    height: SizeConfig.screenHeight / 4,
                    width: SizeConfig.screenWidth),
                VerticalSpacer(),
                TextFormField(
                  autofocus: !_isEditing,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  initialValue: _isEditing ? widget.bikeItem.name : "",
                  decoration: kFormFieldDecoration.copyWith(
                      labelText: kBikeNameLabel, icon: Icon(Icons.label)),
                  validator: (nameVal) {
                    return nameVal.trim().isEmpty ? kBikeNameErrorLabel : null;
                  },
                  onSaved: (nameVal) => _bikeName = nameVal,
                ),
                VerticalSpacer(),
                TextFormField(
                  autofocus: !_isEditing,
                  initialValue: _isEditing ? widget.bikeItem.category : "",
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: kFormFieldDecoration.copyWith(
                      labelText: kCategoryLabel,
                      icon: Icon(Icons.category),
                      hintText: kCategoryHint),
                  validator: (categoryVal) {
                    return categoryVal.trim().isEmpty
                        ? kCategoryErrorLabel
                        : null;
                  },
                  onSaved: (categoryVal) => _category = categoryVal,
                ),
                VerticalSpacer(),
                TextFormField(
                  autofocus: !_isEditing,
                  initialValue: _isEditing ? widget.bikeItem.location : "",
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: kFormFieldDecoration.copyWith(
                      labelText: kLocationLabel, icon: Icon(Icons.location_on)),
                  validator: (locationVal) {
                    return locationVal.trim().isEmpty
                        ? kLocationErrorLabel
                        : null;
                  },
                  onSaved: (locationVal) => _location = locationVal,
                ),
                VerticalSpacer(),
              ],
            ),
          ),
        ));
  }
}
