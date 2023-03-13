import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(), // dart 에서 _ 는 private 을 뜻함
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // symmetric 대칭
        child: ListView(
          children: [
            _title('Recipes'),
            _menus(),
            _listItem(imageName: "burger", title: "Made coffee", des: "커피 설명중입니다 아이스 아메리카노"),
            _listItem(imageName: "coffee", title: "Made Burger", des: "햄버거 만드는 설명입니다. 불고기 버거"),
            _listItem(imageName: "pizza", title: "Made Pizza", des: "피자 만드는 설명입니다. 파인애플 피자"),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white, // 이 방식 보다 테마로 작성하는것이 좋다
      actions: [
        IconButton(
            onPressed: (){
              print("클릭됨");
            },
            icon: Icon(CupertinoIcons.search),
            color: Colors.black),
        SizedBox(width: 15),
        Icon(CupertinoIcons.heart, color: Colors.redAccent),
        SizedBox(width: 15,)
      ],
    );
  }
}

  Widget _title(String text, {double tp = 20.0}) // 디폴트 값을 넣어 놓고 바꿀 수도 있다.
  => Padding(
    padding:  EdgeInsets.only(top: tp ), // 원래 있떤 const를 제거 동적으로 패딩 변환
    child: Text(text,style: TextStyle(fontSize: 30),),
  );

  Widget _menus() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _menu(icon: Icons.food_bank, des: "All"),
              _menu(icon: Icons.emoji_food_beverage, des: "Burger"),
              _menu(icon: Icons.fastfood, des: "Coffee"),
              _menu(icon: Icons.local_pizza, des: "Pizza"),
            ],
          ),
    );
  }

  Widget _menu({required var icon, required String des}) { // 컨테이너를 위젯타입으로 바꿔 놓으면 padding 같은 옵션 줄때 안 터짐
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black87),
        ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.redAccent, size: 30),
                  Text(des)
                ],
              ),
            );
  }

  Widget _listItem({required String imageName, required String title, required String des}) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(  // 여기서 중대한 문제 !! ClipRRect / ClipRect 는 다른거야 왜 이름 비슷하게 만든거냐 ;;
            borderRadius: BorderRadius.circular(15),
            child: AspectRatio(
                aspectRatio: 9/5 ,
                child: Image.asset("assets/images/${imageName}.jpeg",
                    fit: BoxFit.cover)
            ),
          ),
            Text(title, style: TextStyle(fontSize: 30),),
          Text(des),
        ],
      ),
    );
  }