import 'package:donation/core/models/item_model.dart';

abstract class OrderTrackingRepo {
  ///get all data
  Future<List<ItemModel>> getData();

  ///delete product
  Future deleteProduct({required int id});
}
