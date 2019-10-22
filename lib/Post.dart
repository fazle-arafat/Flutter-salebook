/* class Post {
final int userId;
final int id;
final String title;
final String body;

    Post({this.id,this.userId, this.title, this.body});

    factory Post.fromJson(Map<String, dynamic> json) {
    return Post(

    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body'],
    );
    }

  /*  Map toMap() {
      var map = new Map<String, dynamic>();
      map["id"]= id;
      map["userId"] = userId;
      map["title"] = title;
      map["body"] = body;

      return map;
    }*/
}*/

class Post {

  final int id;
  String title;
  String link;


  Post({this.id, this.title, this.link});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'].toString(),
        link: json['link'].toString()
    );
  }
}