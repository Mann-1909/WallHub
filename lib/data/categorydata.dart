import 'package:wallhub/model/categorymodel.dart';



List<CategoriesModel> getCategories(){
  List<CategoriesModel> categories = [];
  CategoriesModel categoryModel = CategoriesModel();

  categoryModel.categoryName = "Cars";
  categoryModel.imgUrl="https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
  categories.add(categoryModel);
  categoryModel=CategoriesModel();

  categoryModel.categoryName = "Street Art";
  categoryModel.imgUrl="https://images.pexels.com/photos/1647121/pexels-photo-1647121.jpeg?auto=compress&cs=tinysrgb&w=600";
  categories.add(categoryModel);
  categoryModel=CategoriesModel();

  categoryModel.categoryName = "Nature";
  categoryModel.imgUrl="https://images.pexels.com/photos/250591/pexels-photo-250591.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
  categories.add(categoryModel);
  categoryModel=CategoriesModel();

  categoryModel.categoryName = "Animals";
  categoryModel.imgUrl="https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
  categories.add(categoryModel);
  categoryModel=CategoriesModel();



  return categories;



}