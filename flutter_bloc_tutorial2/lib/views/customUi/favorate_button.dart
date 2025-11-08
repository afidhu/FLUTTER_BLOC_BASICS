import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc_logics.dart';
import '../../bloc/bloc_states.dart';


class FavorateButton extends StatefulWidget {
  const FavorateButton({super.key});

  @override
  State<FavorateButton> createState() => _FavorateButtonState();
}

class _FavorateButtonState extends State<FavorateButton> {
  @override
  Widget build(BuildContext context) {
    return  BlocSelector<CubitFavorite,bool,bool>(
      selector: (state) => state,
        builder: (context,state) => state ?
        IconButton(
          onPressed: () {
            context.read<CubitFavorite>().clickFavorite();
          },
          icon: Icon(Icons.favorite, color: Colors.pinkAccent,),
        )
            : IconButton(
          onPressed: () {
            context.read<CubitFavorite>().clickFavorite();
          },
          icon: Icon(Icons.favorite_border, color: Colors.black,),
        )
    );
  }
}
// LoadingFavorite