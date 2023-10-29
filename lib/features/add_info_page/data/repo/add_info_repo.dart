import 'package:donation/core/models/item_model.dart';

abstract class AddInfoRepo {
  ///add information to firestore
  Future addToFirebase({required ItemModel itemModel});

  ///add image to storage
  Future<String> addImageToStorage({
    required String imagePath,
    required String imageName,
  });
}
