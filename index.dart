import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/color.dart';

import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List user = [];
  bool isLoading =false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }
  fetchUser() async {
    //just to know if its fetching
    print("fetching..");
    var url = "https://api.sampleapis.com/futurama/characters";

    var response = await http.get(url);
    //just to see in compiling box im printing status code
    print(response.statusCode);
    if(response.statusCode==200){
      var items =json.decode(response.body);
     setState(() {
       user=items;
     });

    }else{
      setState(() {
        user = [];
      });
    }



}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INTERNSHALA FLUTTER PROJECT"),
      ),
      body:getBody(),
    );
  }
  Widget getBody(){
    return ListView.builder(itemBuilder: (context,index){
      return getCard(user[index]);
    });
  }

  Widget getCard(item){
    var fullname = item['name']['first']+" "+item['name']['last'];
    var gender = item['gender'];
    var species = item['species'];
    var homePlanet=item['homePlanet'];
    var occupation = item['occupation'];

    var images = item['images']['main'];

    var sayings = item['sayings'].toString();
    var words= sayings.split('"');
    words= words.toString().split(',');


    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Column(
            children: <Widget>[ Container(
              width:200,
              height: 200,
              decoration: BoxDecoration(
                  color: primary,
                borderRadius: BorderRadius.circular(200/2),
                image: DecorationImage(

                  image: NetworkImage(images),

                )
              ),


            ),
          SizedBox(width: 100,),

              Column(

                //tp push text to left
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(fullname.toString()+'\n',style: TextStyle(fontSize: 22,color: Colors.teal),),
                  Text('Gender :'+gender.toString()+'\n',style: TextStyle(fontSize: 18,color: Colors.teal),),
                  Text('Species :'+species.toString()+'\n',style: TextStyle(fontSize: 18,color: Colors.teal),),
                  Text('HomePlanet :'+homePlanet.toString()+'\n',style: TextStyle(fontSize: 18,color: Colors.teal),),
                  Text('Occupation :'+occupation.toString()+'\n',style: TextStyle(fontSize: 18,color: Colors.teal),),

                for(var i=0;i<words.length;i++)
                  Text(words[i]+'\n',style: TextStyle(fontSize: 15,color: Colors.black87),),
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}
