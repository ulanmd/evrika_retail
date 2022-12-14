
// Include generated file
import 'package:mobx/mobx.dart';

part 'loading.g.dart';

// This is the class used by rest of your codebase
class Loading = _Loading with _$Loading;

// The store-class
abstract class _Loading with Store {
  @observable
  bool isLoading = false;

  @action
  setLoading(bool val) {
    isLoading = val;
  }

  @observable
  bool isSearchOpened = false;

  @action
  setIsSearchOpened(bool val) => isSearchOpened = val;

}