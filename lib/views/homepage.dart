import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp/helper/categorydata.dart';
import 'package:newsapp/helper/newsdata.dart';
import 'package:newsapp/model/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/views/category_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get categories list
  List<CategoryModel> categories = List<CategoryModel>();
// get newslist
  List<ArticleModel>articles = List<ArticleModel>();
bool _loading =true;
  getNews()async{
    News newsdata = News();
    await newsdata.getNews();
    articles = newsdata.datatobesavedin;
    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {

    super.initState();
    categories = getCategories();
    getNews();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text("Daily News", style: TextStyle(color: Colors.white),),
      ),
      body: _loading?Center(child: CircularProgressIndicator(color: Colors.deepOrange,),):SingleChildScrollView(
        child: Container(
          //category widgets
          color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 15,),
                Container(
                  height: 70.0,
                  padding: EdgeInsets.symmetric(horizontal:12.0 ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName,

                    );
                    },

                  ),
                ),
                Container(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                       return NewsTemplate(
                         urlToImage: articles[index].urlToImage,
                         title: articles[index].title,
                         description: articles[index].description,
                       );
                      },
                  )
                ),
              ],
            ),

        ),
      ),
    );
  }
}
class CategoryTile extends StatelessWidget {
  final String categoryName, imageUrl;

  CategoryTile({this.categoryName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryFragment(
          category: categoryName.toLowerCase(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.0),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: imageUrl,
                  width: 170,
                  height: 90,
                  fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 170,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,

              ),
              child: Text(categoryName, style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
class NewsTemplate extends StatelessWidget {
  String title, description, url, urlToImage;
  NewsTemplate({this.title, this.description, this.url, this.urlToImage});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(imageUrl: urlToImage, width: 380,height: 200,fit: BoxFit.cover,
          ),
        ),
      SizedBox(height: 8,),
        Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),
        ),
        Text(description,style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
        ),

      ],
    ),
    );
  }
}
