import 'package:newsapp/model/categorymodel.dart';
List<CategoryModel>getCategories(){
  List<CategoryModel> categories = List<CategoryModel>();
  CategoryModel category = CategoryModel();

  category = new CategoryModel();
  category.categoryName = "Entertainment";
  category.imageUrl = "https://firebasestorage.googleapis.com/v0/b/eee599-15940.appspot.com/o/bus3.jpg?alt=media&token=4bb140f1-8cbe-4022-b09f-b0eff12889fc";
  categories.add(category);

  category = new CategoryModel();
  category.categoryName = "Business";
  category.imageUrl = "https://firebasestorage.googleapis.com/v0/b/eee599-15940.appspot.com/o/bus3.jpg?alt=media&token=4bb140f1-8cbe-4022-b09f-b0eff12889fc";
  categories.add(category);

  category = new CategoryModel();
  category.categoryName = "Sports";
  category.imageUrl = "https://firebasestorage.googleapis.com/v0/b/eee599-15940.appspot.com/o/bus3.jpg?alt=media&token=4bb140f1-8cbe-4022-b09f-b0eff12889fc";
  categories.add(category);

  category = new CategoryModel();
  category.categoryName = "General";
  category.imageUrl = "https://firebasestorage.googleapis.com/v0/b/eee599-15940.appspot.com/o/bus3.jpg?alt=media&token=4bb140f1-8cbe-4022-b09f-b0eff12889fc";
  categories.add(category);

  category = new CategoryModel();
  category.categoryName = "Health";
  category.imageUrl = "https://firebasestorage.googleapis.com/v0/b/eee599-15940.appspot.com/o/bus3.jpg?alt=media&token=4bb140f1-8cbe-4022-b09f-b0eff12889fc";
  categories.add(category);
  return categories;
}

