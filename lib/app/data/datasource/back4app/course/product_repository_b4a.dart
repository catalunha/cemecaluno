import 'package:get/get.dart';
import 'package:mkp01manager/app/data/repository/product_repository.dart';
import 'package:mkp01manager/app/domain/entity/product_entity.dart';
import 'package:mkp01manager/app/domain/usecases/utils/pagination.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProductRepositoryB4a extends GetxService implements ProductRepository {
  final LiveQuery liveQuery = LiveQuery();
  Subscription? subscription;
  @override
  void subscribe(
      {required RxList<ProductEntity> list, Pagination? pagination}) async {
    if (subscription != null) {
      unSubscribe();
    }
    final query = await getQuery(pagination);
    findOld(list, query);
    subscription = await liveQuery.client.subscribe(query);
    subscriptionCreate(list);
    subscriptionUpdate(list);
    subscriptionEnter(list);
    subscriptionLeave(list);
    subscriptionDelete(list);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    unSubscribe();
    super.onClose();
  }

  void unSubscribe() {
    liveQuery.client.unSubscribe(subscription!);
  }

  void subscriptionCreate(RxList<ProductEntity> list) {
    subscription!.on(LiveQueryEvent.create, (value) async {
      print(
          '*** CREATE ***: ${DateTime.now().toString()}. Product.id ${(value as ParseObject).objectId}');
      ProductEntity product = await modelWithSubObject(value);

      list.add(product);
    });
  }

  void subscriptionUpdate(RxList<ProductEntity> list) {
    subscription!.on(LiveQueryEvent.update, (value) async {
      print(
          '*** UPDATE ***: ${DateTime.now().toString()}. Product.id ${(value as ParseObject).objectId}');
      // (value as ParseObject).includeObject(['address']);
      // print(value);
      ProductEntity product = await modelWithSubObject(value);
      list.removeWhere((element) => element.id == product.id);
      list.add(product);
    });
  }

  void subscriptionEnter(RxList<ProductEntity> list) {
    subscription!.on(LiveQueryEvent.enter, (value) async {
      print(
          '*** ENTER ***: ${DateTime.now().toString()}. Product.id ${(value as ParseObject).objectId}');

      ProductEntity product = await modelWithSubObject(value);
      list.add(product);
    });
  }

  void subscriptionLeave(RxList<ProductEntity> list) {
    subscription!.on(LiveQueryEvent.leave, (value) async {
      print(
          '*** LEAVE ***: ${DateTime.now().toString()}. Product.id ${(value as ParseObject).objectId}');
      list.removeWhere((element) => element.id == (value).objectId);
    });
  }

  void subscriptionDelete(RxList<ProductEntity> list) {
    subscription!.on(LiveQueryEvent.delete, (value) async {
      print(
          '*** DELETE ***: ${DateTime.now().toString()}. Product.id ${(value as ParseObject).objectId}');

      list.removeWhere((element) => element.id == (value).objectId);
    });
  }

  Future<QueryBuilder<ParseObject>> getQuery(Pagination? pagination) async {
    QueryBuilder<ParseObject> queryProduct =
        QueryBuilder<ParseObject>(ParseObject('Product'));
    // var currentUser = await ParseUser.currentUser() as ParseUser?;
    // queryProduct.whereEqualTo('isAvaliable', true);
    if (pagination != null) {
      queryProduct.setAmountToSkip((pagination.page - 1) * pagination.limit);
      queryProduct.setLimit(pagination.limit);
    }
    queryProduct.keysToReturn([
      'code',
      'name',
      'image',
      'description',
      'price',
      'isAvaliable',
      'menuIsOpen',
    ]);
    // queryProduct.selectKeys('name', 'Ana');
    queryProduct.orderByAscending('name');
    // queryProduct.includeObject(['address']);
    return queryProduct;
  }

  Future<ProductEntity> modelWithSubObject(ParseObject value) async {
    // if (value.containsKey('address')) {
    //   ParseObject address = (value).get('address');
    //   await address.fetch();
    // }
    // if ((value).get('address') != null) {
    //   await (value).get('address').fetch();
    // }
    final productNew = ProductEntity.fromParse(value);
    return productNew;
  }

  Future<void> findOld(
      RxList<ProductEntity> list, QueryBuilder<ParseObject> query) async {
    final ParseResponse apiResponse = await query.query();
    if (apiResponse.success && apiResponse.results != null) {
      // print(apiResponse.results);
      List<ProductEntity> productList = [];
      productList =
          apiResponse.results!.map((e) => ProductEntity.fromParse(e)).toList();
      list.addAll(productList);
    } else {
      print('sem produtos...');
    }
  }

  @override
  Future<void> create(ProductEntity productModel) async {
    final product = await productModel.toParse();
    await product.save();
  }

  @override
  Future<void> update(ProductEntity productModel) async {
    final product = await productModel.toParse();
    print(product);
    await product.save();
  }

  @override
  Future<void> delete(String id) async {
    var todo = ParseObject('Product')..objectId = id;
    await todo.delete();
  }
}
