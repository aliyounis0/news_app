

import 'package:app_news/layout/web_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget builderItem ( List article ,context){
  return SingleChildScrollView(
    child: Column(
      children: [
        CarouselSlider(
            items:
              article.map((e) =>Image(image:NetworkImage('${e['urlToImage']}'),
                width:double.infinity,
                fit: BoxFit.cover,
              ),).toList(),

            options: CarouselOptions(
              height: 150,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2,),
              autoPlayInterval: Duration(seconds: 4)
            ),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index)=>InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>webView(article[index]['url'])));
                },
                  child: itemBuilder(article,index)),
              separatorBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 2, color:Colors.grey,
                ),
              ),
              itemCount: article.length,
          ),
        ),
      ],
    ),
  );
}









Widget itemBuilder(List article,index)
{
  return Column(
    children: [
      Container(
        height: 300,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${article[index]['title']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${article[index]['description']}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${article[index]['urlToImage']}',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),

                ),
              ),


            ],
          ),
        ),
      ),



    ],
  );
}