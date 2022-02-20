// internals
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveElevatedButton extends StatelessWidget {
  final String text;
  final Function handler;

  const AdaptiveElevatedButton({
    Key key,
    @required this.text,
    @required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).colorScheme.primary,
            child: Text(text),
            onPressed: handler,
          )
        : ElevatedButton(
            child: Text(text),
            onPressed: handler,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
  }
}
