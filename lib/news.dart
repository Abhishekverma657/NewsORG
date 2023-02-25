import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
 
import 'package:readmore/readmore.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  late Map data;
 List Newsarticle=[];
  void getdata() async {
     try{
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2023-01-24&sortBy=publishedAt&apiKey=eb1d5726484d4224b3c5f7ea649c7a4b");
    var res = await http.get(url);
    // data=jsonDecode(res.body);
     if(res.statusCode==200){
     

    setState(() {
      //  print(res.body);
      data = json.decode(res.body);
      Newsarticle = data["articles"];
      // print(Newsarticle.length);
      //  print(Newsarticle);
    });
     }}catch(e){
      print(e);
     }
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: HStack([
            "Social".text.gray200.make(),
            WidthBox(3),
            "X".text.white.size(30).make()
          ])),
      body: Newsarticle==null?CircularProgressIndicator(): ListView.builder(
          shrinkWrap: true,
          itemCount: Newsarticle.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shadowColor: Colors.blueGrey,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(Newsarticle[index]["publishedAt"]),
                              WidthBox(4),
                              Text(Newsarticle[index]["source"]["name"])
                            ],
                          ),
                          Newsarticle==null? Center(child: CircularProgressIndicator()): ListTile(
                            title: Text(Newsarticle[index]["title"].toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                            subtitle: ReadMoreText(
                              Newsarticle[index]["content"],
                              trimLines: 2,
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                            ),
                           trailing: Image.network(
                               Newsarticle[index]["urlToImage"].toString(),
                              height: MediaQuery.of(context).size.height,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
