import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({this.movies});
  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;
  int _currentPage = 0; // 캐러셀 슬라이더에서 현재 이미지의 위치
  String _currentKeyWord; // 현재페이지에 기록되어 있는 키워드

  @override
  void initState() {
    super.initState(); // 상위클래스에서 movies를 가져와 참조
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyWord = keywords[0]; // 초기값을 선언
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyWord = keywords[_currentPage]; // 페이지전환
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyWord,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      likes[_currentPage]
                          ? IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {},
                            )
                          : IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                      Text(
                        '내가 찜한 콘텐츠',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                        ),
                        Text(
                          '재생',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                      Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = []; //반환할 위젯
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }
  return results; // 완성된 함수를 반환
}
