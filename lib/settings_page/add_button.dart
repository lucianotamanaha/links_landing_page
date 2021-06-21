import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:links_landing_page/models/link_data.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    final _linksCollection = Provider.of<CollectionReference>(context);
    TextEditingController _titleTextController = TextEditingController();
    TextEditingController _urlTextController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return SizedBox(
      width: _width,
      child: ElevatedButton(
        child: Text('Add button'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add New Button'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? 'Please add a title' : null;
                        },
                        controller: _titleTextController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Name of your social media',
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? 'Please add a url' : null;
                        },
                        controller: _urlTextController,
                        decoration: InputDecoration(
                          labelText: 'Url',
                          hintText: 'Link of your social media',
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _linksCollection.add(
                            LinkData(
                              title: _titleTextController.text,
                              url: _urlTextController.text,
                            ).toMap(),
                          );
                          Navigator.of(context).pop();
                          _formKey.currentState.reset();
                        }
                      },
                      child: Text('Add')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel')),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
