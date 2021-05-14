import 'package:flutter/material.dart';

Text parseCreator(creator) {
  var first = "";
  var last = "";

  if (creator["firstName"] != null) {
    first = creator["firstName"]!;
  }

  if (creator["lastName"] != null) {
    last = creator["lastName"]!;
  }

  return Text(first + " " + last + "; ");
}
