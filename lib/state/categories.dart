import 'package:mobx/mobx.dart';

import '../models/category.dart';
import '../models/item.dart';


// Include generated file
part 'categories.g.dart';

// This is the class used by rest of your codebase
class Categories = _Categories with _$Categories;

// The store-class
abstract class _Categories with Store {
  @observable
  Category newCat = Category();

  @observable
  Map<int, List<Category>?> steps = {1: []};

  @observable
  int currentStep = 1;

  ObservableList<String> breadcrumbs = ObservableList.of(['Главная']);

  ObservableList<Item> itemsFromCategory = ObservableList.of([]);

  @observable
  bool isLastStep = false;

  @action
  addItem(Item item) => itemsFromCategory.add(item);

  @action
  emptyItemList() => itemsFromCategory = ObservableList.of([]);

  @action
  setNewCat(dynamic value) => newCat = value;

  @action
  itIsLastStep() => isLastStep = true;

  @action
  addToCategory(int stepNum, Category? category) {
    breadcrumbs.add(category?.name ?? '');
    currentStep = stepNum;
    steps[stepNum] = category?.children ?? [];
  }

  @action
  deleteCategoryFromBreadCrumb(int num) {
    currentStep = num + 1;
    breadcrumbs.removeRange(num + 1, breadcrumbs.length);
    isLastStep=false;
  }
}
