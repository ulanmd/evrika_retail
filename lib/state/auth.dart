// Include generated file
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth.g.dart';

// This is the class used by rest of your codebase
class Auth = _Auth with _$Auth;

// The store-class
abstract class _Auth with Store {
  @observable
  bool isAuth = false;

  @observable
  String name = 'default';

  @observable
  String nameInit = '';

  @action
  void initLogin(nameInitials, employeeName){
    isAuth=true;
    nameInit = nameInitials;
    name = employeeName;
  }

  Future login(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String employeeName = await sp.getStringList('me')![0];
    List result = employeeName.split(' ');
    String nameInitials = result[1][0] + result[0][0];
    await sp.setStringList('userData', [token, employeeName, nameInitials]);
    runInAction((){
      isAuth = true;
      nameInit = nameInitials;
      name = employeeName;
    });
  }

  void logout() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('accessToken');
    runInAction(() => isAuth=false);
  }
}
