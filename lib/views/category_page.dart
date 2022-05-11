import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/helper/newsdata.dart';
import 'package:newsapp/model/newsmodel.dart';
class CategoryFragment extends StatefulWidget {
  String category;
  CategoryFragment({this.category});
  @override
  _CategoryFragmentState createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  List<ArticleModel>articles = List<ArticleModel>();
 bool _loading = true;
  getNews()async{
    CategoryNews newsdata = CategoryNews();
    await newsdata.getNews(widget.category);
    articles = newsdata.datatobesavedin;
    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text(widget.category.toUpperCase(), style: TextStyle(color: Colors.white),),
      ),
      body: _loading?Center(child: CircularProgressIndicator(color: Colors.deepOrange,),):SingleChildScrollView(
        child: Container(
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
