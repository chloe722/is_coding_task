import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/model/data.dart';
import 'package:is_coding_task/size_config.dart';
import 'package:is_coding_task/strings.dart';
import 'package:is_coding_task/widgets/center_indicator.dart';
import 'package:is_coding_task/widgets/spacer.dart';

typedef OnSaveCallback = Function(BikeItem bikeItem);

class EditAddScreen extends StatefulWidget {
  EditAddScreen({this.bikeItem, this.isEditing = false, @required this.onSave});

  final BikeItem bikeItem;
  final bool isEditing;
  final OnSaveCallback onSave;

  @override
  _EditAddScreenState createState() => _EditAddScreenState();
}

class _EditAddScreenState extends State<EditAddScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get _isEditing => widget.isEditing;
  String _bikeName;
  String _category;
  String _location;
  String _selectedFrameSize;
  String _selectedPrice;
  String _description;
  String _bikePhotoUrl;

  @override
  void initState() {
    if (_isEditing) {
      _selectedFrameSize = widget.bikeItem.frameSize;
      _selectedPrice = widget.bikeItem.priceRange;
      _bikePhotoUrl = widget.bikeItem.photoUrl;
    } else {
      _bikePhotoUrl = bikePlaceHolderImage;
    }
    super.initState();
  }

  void _onSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      //TODO check again
      BikeItem _bikeItem = BikeItem(
          name: _bikeName,
          category: _category,
          location: _location,
          frameSize: _selectedFrameSize,
          priceRange: _selectedPrice,
          description: _description,
          photoUrl: _bikePhotoUrl);

      widget.onSave(_bikeItem);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView(
                    children: <Widget>[
                      CachedNetworkImage(
                          imageUrl: _bikePhotoUrl,
                          placeholder: (context, url) => CenterIndicator(),
                          fit: BoxFit.contain,
                          height: SizeConfig.screenHeight / 4,
                          width: SizeConfig.screenWidth),
                      VerticalSpacer(height: 24),
                      TextFormField(
                        autofocus: !_isEditing,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        initialValue: _isEditing ? widget.bikeItem.name : "",
                        decoration: kFormFieldDecoration.copyWith(
                            labelText: kBikeNameLabel, icon: Icon(Icons.label)),
                        validator: (val) {
                          return val.trim().isEmpty
                              ? kBikeNameErrorLabel
                              : null;
                        },
                        onSaved: (val) => _bikeName = val,
                      ),
                      VerticalSpacer(height: 24),
                      TextFormField(
                        autofocus: !_isEditing,
                        initialValue:
                            _isEditing ? widget.bikeItem.category : "",
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: kFormFieldDecoration.copyWith(
                            labelText: kCategoryLabel,
                            icon: Icon(Icons.category),
                            hintText: kCategoryHint),
                        validator: (val) {
                          return val.trim().isEmpty
                              ? kCategoryErrorLabel
                              : null;
                        },
                        onSaved: (val) => _category = val,
                      ),
                      VerticalSpacer(height: 24),
                      TextFormField(
                        autofocus: !_isEditing,
                        initialValue:
                            _isEditing ? widget.bikeItem.location : "",
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: kFormFieldDecoration.copyWith(
                            labelText: kLocationLabel,
                            icon: Icon(Icons.location_on)),
                        validator: (val) {
                          return val.trim().isEmpty
                              ? kLocationErrorLabel
                              : null;
                        },
                        onSaved: (val) => _location = val,
                      ),
                      VerticalSpacer(height: 24),
                      DropdownButtonFormField(
                        decoration: kFormFieldDecoration.copyWith(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            labelText: kBikeFrameSizeLabel,
                            icon: Icon(Icons.directions_bike)),
                        onChanged: (val) {
                          setState(() {
                            _selectedFrameSize = val;
                          });
                        },
                        validator: (val) {
                          return val == null ? kFrameSizeError : null;
                        },
                        onSaved: (val) => _selectedFrameSize = val,
                        value: _selectedFrameSize,
                        items: frameSizes
                            .map((frameSize) => DropdownMenuItem(
                                  child: Text(frameSize),
                                  value: frameSize,
                                ))
                            .toList(),
                      ),
                      VerticalSpacer(height: 24),
                      DropdownButtonFormField(
                        decoration: kFormFieldDecoration.copyWith(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            labelText: kBikePriceRangeLabel,
                            icon: Icon(Icons.attach_money)),
                        validator: (val) {
                          return val == null ? kPriceRangeError : null;
                        },
                        onChanged: (val) {
                          setState(() {
                            _selectedPrice = val;
                          });
                        },
                        onSaved: (val) => _selectedPrice = val,
                        value: _selectedPrice,
                        items: priceRange
                            .map((price) => DropdownMenuItem(
                                  child: Text(price),
                                  value: price,
                                ))
                            .toList(),
                      ),
                      VerticalSpacer(height: 24),
                      TextFormField(
                        autofocus: !_isEditing,
                        initialValue:
                            _isEditing ? widget.bikeItem.description : "",
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: kFormFieldDecoration.copyWith(
                            labelText: kBikeDescriptionLabel,
                            hintText: kBikeDescriptionHint,
                            icon: Icon(Icons.description)),
                        validator: (val) {
                          return val.trim().isEmpty
                              ? kBikeDescriptionError
                              : null;
                        },
                        onSaved: (val) => _description = val,
                      ),
                      VerticalSpacer(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonTheme(
                minWidth: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: RaisedButton(
                  color: kDarkGreen,
                  child: Text("Save", style: TextStyle(color: Colors.white)),
                  onPressed: () => _onSave(),
                ),
              ),
            )
          ],
        ));
  }
}
