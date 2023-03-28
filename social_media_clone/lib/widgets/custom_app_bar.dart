import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_media_clone/utils/customColors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  final Size preferredSize;
  final String title;

  const CustomAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: CustomColors.textButtonColor),),
      centerTitle: true,
      actions: [
        Icon(Icons.add, color: CustomColors.textButtonColor),
        Icon(Icons.favorite, color: CustomColors.textButtonColor),
        Icon(Icons.message, color: CustomColors.textButtonColor),
      ],
    );
  }
}