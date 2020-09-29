import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;
  final DocumentReference
      reference; // 실제 파이어베이스에 있는 데이터컬럼을 참조할수 있는 링크 CRUD를 쉽게 만들어준다.

  Movie.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  Movie.fromSnapShot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Movie<$title:$keyword>";
}
