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

  @observable
  bool showLoginAgain = false;

  @action
  void initLogin(employeeName) {
    isAuth = true;
    nameInit = employeeName.split(' ')[1][0] + employeeName.split(' ')[0][0];
    name = employeeName;
  }

  Future login() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String employeeName = sp.getString('me') ?? '';
    String nameInitials =
        employeeName.split(' ')[1][0] + employeeName.split(' ')[0][0];
    await sp.setString('lastRefresh', DateTime.now().toString());
    await sp.setString('employeeName', employeeName);
    runInAction(() {
      isAuth = true;
      nameInit = nameInitials;
      name = employeeName;
    });
  }

  Future refreshToken(String token, String refreshToken) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String employeeName = await sp.getStringList('me')![0];
    await sp.setString('accessToken', token);
    await sp.setString('refreshToken', refreshToken);
    await sp.setString('lastRefresh', DateTime.now().toString());
    await sp.setString('employeeName', employeeName);
    runInAction(() {
      isAuth = true;
    });
  }

  void logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('accessToken');
    sp.remove('refreshToken');
    runInAction(() {
      isAuth = false;
      nameInit = '';
      name = '';
    });
  }

  @action
  setShowLoginAgain(bool val) => showLoginAgain = val;
}
