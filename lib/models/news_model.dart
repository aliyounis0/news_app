
class newsModel
{
  String? status;
  List<articlesModel> articles=[];

  newsModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    json["articles"].forEach((value){
      articles.add(articlesModel.fromJason(value));
    });
  }

}

class  articlesModel{
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  articlesModel.fromJason(Map<String,dynamic> json){
    title=json["title"];
    description=json["description"];
    url=json["url"];
    urlToImage=json["urlToImage"];
    content=json["content"];
  }
}



