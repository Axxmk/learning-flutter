import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveTextButton extends StatelessWidget {
  final String text;
  final Function handler;

  const AdaptiveTextButton({
    Key key,
    @required this.text,
    @required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onPressed: handler,
          )
        : TextButton(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onPressed: handler,
          );
  }
}
