enum Images {
  logo(imageExtension: ImageEXtensions.png);

  const Images({this.imageExtension = ImageEXtensions.png});
  final ImageEXtensions imageExtension;
}

enum ImageEXtensions { png, jpg, svg }

extension ImagesListPath on Images {
  String path() {
    return "assets/images/$name.${imageExtension.name}";
  }
}
