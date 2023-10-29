import 'package:donation/core/models/item_model.dart';
import 'package:donation/core/services/firebase/firebase_storage/firebase_storage.dart';
import 'package:donation/core/services/firebase/firestore/firestore.dart';

import 'add_info_repo.dart';

class AddInfoRepoImplementation extends AddInfoRepo {
  FireStore fireStore;
  FireStorage fireStorage;

  AddInfoRepoImplementation({
    required this.fireStore,
    required this.fireStorage,
  });

  @override
  Future addToFirebase({required ItemModel itemModel}) async {
    try {
      await fireStore.addToFireStore(model: itemModel);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<String> addImageToStorage({
    required String imagePath,
    required String imageName,
  }) async {
    try {
      return await fireStorage.addImageToStorage(
        imagePath: imagePath,
        imageName: imageName,
      );
    } catch (e) {
      print(e);
    }
    return '';
  }
}
