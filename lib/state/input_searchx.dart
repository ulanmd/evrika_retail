
import 'package:mobx/mobx.dart';

import '../models/item.dart';

// Include generated file
part 'input_searchx.g.dart';

// This is the class used by rest of your codebase
class InputSearchX = _InputSearchX with _$InputSearchX;

// The store-class
abstract class _InputSearchX  with Store {

  ObservableList<Item> loadedItems = ObservableList.of([]);

  @action
  addItem(Item item) => loadedItems.add(item);

  @action
  emptyAddedItems() => loadedItems = ObservableList.of([]);

}
