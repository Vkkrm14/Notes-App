// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class DrawerTile extends StatelessWidget {
  final String title;
  final IconData leading;
  void Function()? onTap;
   DrawerTile({super.key,required this.title,required this.leading,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(title,style: TextStyle
          (color: Theme.of(context).colorScheme.inversePrimary,fontWeight: FontWeight.bold),),
        leading: Icon(leading,color: Theme.of(context).colorScheme.inversePrimary,),
        onTap: onTap,
      ),
    );
  }
}
