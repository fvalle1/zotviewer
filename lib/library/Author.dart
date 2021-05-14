String parseCreator(creator) {
  var first = "";
  var last = "";

  if (creator["firstName"] != null) {
    first = creator["firstName"]!;
  }

  if (creator["lastName"] != null) {
    last = creator["lastName"]!;
  }

  return first + " " + last;
}
