import 'package:mobx/mobx.dart';

import '../../models/item.dart';

// Include generated file
part 'search_qrx.g.dart';

// This is the class used by rest of your codebase
class SearchQrX = _SearchQrX with _$SearchQrX ;

// The store-class
abstract class _SearchQrX  with Store {

  @observable
  bool itemWasFound = false;

  @observable
  bool incorrectCode = false;

  @observable
  bool allow = false;

  @observable
  Item foundItem = Item(attributes: ItemAttributes(fullName: 'null', photo: 'null'));

  @action
  setItemWasFound(bool value) => itemWasFound = value;

  @action
  setIncorrectCode(bool value) => incorrectCode = value;

  @action
  setAllow(bool value) => allow = value;

  @action
  setItem(Item item) => foundItem = item;

}
