import 'package:mobx/mobx.dart';

import '../models/item.dart';

// Include generated file
part 'orderx.g.dart';

// This is the class used by rest of your codebase
class OrderX = _OrderX with _$OrderX;

// The store-class
abstract class _OrderX with Store {

  ObservableList<Item> addedItems = ObservableList.of([]);

  @action
  addItem(Item item) => addedItems.add(item);

  @action
  removeItem(Item item) => addedItems.remove(item);

  @action
  emptyAddedItems() => addedItems = ObservableList.of([]);

}
