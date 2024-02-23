// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation/core/models/item_model.dart';
import 'package:donation/core/services/firebase/firebase_auth/auth_firebase.dart';

class FireStore {
  FireAuth auth;

  ///Firebase(1-enable 2-package 3-instance)
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FireStore({required this.auth});

  ///add data to firebase
  addToFireStore({required ItemModel model}) async {
    try {
      await firestore
          .collection('Users')
          .doc(auth.firebaseAuth.currentUser!.uid)
          .collection('listOfItems')
          .doc(model.getId.toString())
          .set(model.toJson());
    } catch (e) {
      print(e);
    }
  }

  ///get data from firebase
  Future<List<ItemModel>> getData() async {
    QuerySnapshot<Map<String, dynamic>> result = await firestore
        .collection('Users')
        .doc(auth.firebaseAuth.currentUser!.uid)
        .collection('listOfItems')
        .get();
    List<ItemModel> items =
        result.docs.map((e) => ItemModel.fromJson(e.data())).toList();
    if (items.isNotEmpty) {
      return items;
    } else {
      return [];
    }
  }

  ///delete product by id
  deleteProduct({required int id}) async {
    try {
      await firestore
          .collection('Users')
          .doc(auth.firebaseAuth.currentUser!.uid)
          .collection('listOfItems')
          .doc(id.toString())
          .delete();
    } catch (e) {
      print(e);
    }
  }

  ///delete all products
  deleteProducts() async {
    try {
      await firestore
          .collection('Users')
          .doc(auth.firebaseAuth.currentUser!.uid)
          .collection('listOfItems')
          .get()
          .then(
        (snapshot) {
          for (DocumentSnapshot doc in snapshot.docs) {
            doc.reference.delete();
          }
        },
      );
      print('deleted products');
    } catch (e) {
      print(e);
    }
  }
}
