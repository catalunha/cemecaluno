import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProductEntity {
  static const String className = 'Course';

  final String? id;
  final String name;
  final String season;
  final String community;
  final String program;
  final String description;
  final double price;
  final ParseFileBase image;
  final bool isAvaliable;
  final bool menuIsOpen;
  //
  XFile? xfile;
  // ParseFile? parseFile;
  String get imageUrl {
    return image.url!;
  }
}
