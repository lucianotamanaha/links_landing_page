import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:links_landing_page/models/link_data.dart';
import 'package:provider/provider.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key key,
    @required this.document,
  }) : super(key: key);

  final LinkData document;

  @override
  Widget build(BuildContext context) {
    final _linksCollection = Provider.of<CollectionReference>(context);
    TextEditingController _titleTextController =
        TextEditingController(text: document.title);
    TextEditingController _urlTextController =
        TextEditingController(text: document.url);
    final _formKey = GlobalKey<FormState>();
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Edit ${document.title} Button'),
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
                      final userChandedTitle =
                          document.title != _titleTextController.text;
                      final userChandedUrl =
                          document.url != _urlTextController.text;
                      final userUpdateForm = userChandedTitle || userChandedUrl;
                      if (_formKey.currentState.validate()) {
                        if (userUpdateForm) {
                          final newLinkData = LinkData(
                            title: _titleTextController.text,
                            url: _urlTextController.text,
                          );
                          _linksCollection.doc(document.id).update(
                                newLinkData.toMap(),
                              );
                        }
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Edit')),
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
    );
  }
}
