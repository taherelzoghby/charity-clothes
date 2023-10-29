import 'package:donation/core/models/item_model.dart';
import 'package:donation/core/services/firebase/firestore/firestore.dart';
import 'package:donation/features/order_tracking/data/repo/order_tracking_repo.dart';

class OrderTrackingRepoImplementation extends OrderTrackingRepo {
  FireStore fireStore;

  OrderTrackingRepoImplementation({required this.fireStore});

  @override
  Future deleteProduct({required int id}) async {
    try {
      await fireStore.deleteProduct(id: id);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<ItemModel>> getData() async {
    try {
      List<ItemModel> data = await fireStore.getData();
      return data;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
