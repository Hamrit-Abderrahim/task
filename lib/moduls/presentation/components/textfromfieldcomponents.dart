import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/moduls/presentation/controller/bloc.dart';
import 'package:task/moduls/presentation/controller/state.dart';

import '../../../core/utils/strings_manager.dart';

class TextFormComponents extends StatelessWidget {
  TextFormComponents({Key? key}) : super(key: key);
  var sercheController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) {
            PlayersBloc.get(context).search(value.toLowerCase());
            if (sercheController.text.isEmpty) {
              PlayersBloc.get(context).searchingfalse();
            } else {
              PlayersBloc.get(context).searchingTrue();
            }
          },
          style: const TextStyle(color: Colors.black),
          controller: sercheController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xfff2f2f4),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffC9C9C9), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            errorStyle: TextStyle(fontSize: 14),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            contentPadding: EdgeInsets.all(10),
            labelText: StringsManager.searchPlayer,
            prefixIcon: Icon(Icons.search),
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            hintStyle: TextStyle(fontSize: 21, color: Colors.black),
          ),
        );
      },
    );
  }
}
