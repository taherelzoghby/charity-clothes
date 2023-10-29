import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorage {
  final storage = FirebaseStorage.instance;
  Future<String> addImageToStorage({
    required String imagePath,
    required String imageName,
  }) async {
    ///store path
    final Reference imageReference = storage.ref().child(
          'products_images/$imageName',
        );

    ///put image on it
    final TaskSnapshot uploadedImage = await imageReference.putFile(
      File(imagePath),
    );

    ///get download url
    final String imageLink = await uploadedImage.ref.getDownloadURL();
    return imageLink;
  }
}
