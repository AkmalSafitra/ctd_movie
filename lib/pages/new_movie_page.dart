import 'package:auto_route/auto_route.dart';
import 'package:ctd_movie/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../core/color.dart';
import '../core/genre.dart';
import '../routers/app_routers.dart';

class NewMoviePage extends StatelessWidget {
  NewMoviePage({
    Key? key,
  }) : super(key: key);

  final _controllerTitle = TextEditingController();
  final _controllerDirector = TextEditingController();
  final _controllerSummary = TextEditingController();
  List<Genre> _selectedGenres = [];

  final _items =
      genre.map((genre) => MultiSelectItem<Genre>(genre, genre.name)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Movie'),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              //check blank field
              if (_controllerTitle.text.length == 0) {
                customAlert(
                  title: 'Warning',
                  context: context,
                  subtitle: const Text('Please Fill Title', style: TextStyle(fontSize: 14),),
                  buttonTitle: 'OK',
                  onPressed: () => Navigator.pop(context),
                );
              } else if (_controllerDirector.text.length == 0) {
                customAlert(
                  title: 'Warning',
                  context: context,
                  subtitle: const Text('Please Fill Director', style: TextStyle(fontSize: 14),),
                  buttonTitle: 'OK',
                  onPressed: () => Navigator.pop(context),
                );
              } else if (_selectedGenres.length == 0) {
                customAlert(
                  title: 'Warning',
                  context: context,
                  subtitle: const Text('Please Choose Genre', style: TextStyle(fontSize: 14),),
                  buttonTitle: 'OK',
                  onPressed: () => Navigator.pop(context),
                );
              } else if (_controllerSummary.text.length == 0) {
                customAlert(
                  title: 'Warning',
                  context: context,
                  subtitle: const Text('Please Fill Summary', style: TextStyle(fontSize: 14),),
                  buttonTitle: 'OK',
                  onPressed: () => Navigator.pop(context),
                );
              } else {
                customAlert(
                  title: 'Success',
                  context: context,
                  subtitle: const Text('New Movie Saved'),
                  buttonTitle: 'OK',
                  onPressed: () {
                    movieMobx.saveMovie(
                      _controllerTitle.text,
                      _controllerDirector.text,
                      _selectedGenres,
                      _controllerSummary.text,
                    );
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                );
              }
            },
            child: const Text(
              'Save',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(controller: _controllerTitle, label: 'Title', maxLen: 100, maxLines: 1),
                const SizedBox(height: 20),
                CustomTextField(
                    controller: _controllerDirector, label: 'Director', maxLen: 100, maxLines: 1),
                const SizedBox(height: 20),
                MultiSelectDialogField(
                  items: _items,
                  title: const Text("Genre"),
                  listType: MultiSelectListType.CHIP,
                  decoration: BoxDecoration(
                    color: blueCT.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      // color: blueCT,
                      width: 1,
                    ),
                  ),
                  buttonIcon: const Icon(
                    Icons.arrow_drop_down_outlined,
                  ),
                  buttonText: const Text(
                    "Genre",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (results) {
                    _selectedGenres = results as List<Genre>;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    controller: _controllerSummary, label: 'Summary', maxLen: 1000, maxLines: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
