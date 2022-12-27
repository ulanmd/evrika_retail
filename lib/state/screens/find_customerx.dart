import 'package:mobx/mobx.dart';

// Include generated file
part 'find_customerx.g.dart';

// This is the class used by rest of your codebase
class FindCustomerX = _FindCustomerX with _$FindCustomerX;

// The store-class
abstract class _FindCustomerX with Store {

  @observable
  int iconOfNumberInput = 0;

  @observable
  bool correctNumber = false;

  @observable
  String clientNumber = '';

  @action
  setIconOfNumberInput(int val) => iconOfNumberInput = val;

  @action
  setCorrectNumber(bool val) => correctNumber = val;

  @action
  setClientNumber(String val) => clientNumber = val;

}
