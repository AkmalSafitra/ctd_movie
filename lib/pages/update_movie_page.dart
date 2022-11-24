import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../core/color.dart';
import '../core/genre.dart';
import '../core/movie_model.dart';
import '../main.dart';
import '../routers/app_routers.dart';

class UpdateMoviePage extends StatefulWidget {
  final int id;

  UpdateMoviePage({Key? key, required this.id}) : super(key: key);

  @override
  State<UpdateMoviePage> createState() => _UpdateMoviePageState();
}

class _UpdateMoviePageState extends State<UpdateMoviePage> {
  var _controllerTitle = TextEditingController();

  var _controllerDirector = TextEditingController();

  var _controllerSummary = TextEditingController();

  List<Genre> _selectedGenres = [];

  final _items =
      genre.map((genre) => MultiSelectItem<Genre>(genre, genre.name)).toList();

  @override
  void initState() {
    List<MovieModel> movieData =
        movieMobx.movies.where((element) => element.id == widget.id).toList();

    _controllerTitle.text = movieData[0].title;
    _controllerDirector.text = movieData[0].director;
    _selectedGenres = movieData[0].genres;
    _controllerSummary.text = movieData[0].summary;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Movie'),
        centerTitle: false,
        actions: [
          TextButton(
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              customAlertYesNo(
                context: context,
                title: 'Delete Movie',
                buttonTitle: 'Yes',
                subtitle: const Text('Are You Sure?', style: TextStyle(fontSize: 14),),
                onPressed: () {
                  movieMobx.deleteMovie(widget.id);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                buttonTitle2: 'No',
                onPressed2: () {
                  Navigator.pop(context);
                },
              );
            },

          ),
          TextButton(
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
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
                customAlertYesNo(
                  context: context,
                  title: 'Update Movie',
                  buttonTitle: 'Yes',
                  subtitle: const Text('Are You Sure?', style: TextStyle(fontSize: 14),),
                  onPressed: () {
                    movieMobx.updateMovie(
                      widget.id,
                      _controllerTitle.text,
                      _controllerDirector.text,
                      _selectedGenres,
                      _controllerSummary.text,
                    );
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  buttonTitle2: 'No',
                  onPressed2: () {
                    Navigator.pop(context);
                  },
                );
              }

            },

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
                  initialValue: _selectedGenres,
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
