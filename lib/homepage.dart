import 'package:flutter/material.dart';
import 'package:rowandcolumn/signin.dart';
import 'package:rowandcolumn/homepage.dart';

class newo extends StatelessWidget {
  const newo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(centerTitle:true,
        title: Image.asset("assets/images/ai.jpg"),

      ),
      drawer:Drawer(
        child: ListView(padding: EdgeInsets.all(5.0),
        children: [const DrawerHeader(decoration: BoxDecoration(color: Colors.blue),
          child: Text('Drawer Header'),),
          ListTile(leading: Icon(Icons.home),
            title: const Text('page 1'),onTap: (){Navigator.pop(context);},)],)
        ,
    ) ,
      body: Container(
        child:Center(
          child: Column(
            children: [Text("Hello"),
              Image.asset("assets/images/logo.jpg"),
              Text("select the course"),
              Image.asset("assets/images/three.jpg")],),

        ) ,

      ),
      bottomNavigationBar: Container(color:Colors.green,height: 56,margin: EdgeInsets.symmetric(vertical: 24,horizontal: 12,),
      child: Row(
        children: <Widget>[Container(width: 66,color: Colors.green,child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          Icon(Icons.chat),Text("CHAT",style: TextStyle(color: Colors.lightBlue),)
        ],),),Container(width: 66,color: Colors.green,child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          Icon(Icons.notifications),Text("Notoif",style: TextStyle(color: Colors.lightBlue),)
        ],),),Expanded(child: Container(color:Colors.red,alignment: Alignment.center,child: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),))],
      ),),
    );
  }
}
