import 'package:flutter/material.dart';

pushTo(context, Widget nextScreen) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => nextScreen,
  ));
}

pushWithReplacement (context, Widget nextScreen ) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => nextScreen,
  ));
}

popFrom (context,) {
  Navigator.of(context).pop();
}
