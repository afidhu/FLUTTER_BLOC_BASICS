import 'package:flutter/material.dart';


class FavorateButton extends StatefulWidget {
  const FavorateButton({super.key});

  @override
  State<FavorateButton> createState() => _FavorateButtonState();
}

class _FavorateButtonState extends State<FavorateButton> {
  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: (){},
        icon: Icon(Icons.favorite)
    );
  }
}
