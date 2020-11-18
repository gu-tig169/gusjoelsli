import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),

    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.amber,    //ändrar färg på appbaren
      title: Text('Min ToDo', style: TextStyle(color: Colors.white, fontSize: 24.0)), //titeln i AppBaren
        actions: [
          IconButton(icon: Icon(Icons.more_vert_outlined), //ikonen som kommer användas till popupmenyn sen
          onPressed:() {},
          ),
        ],
      ),
    
      body: _list(),

      floatingActionButton: FloatingActionButton( onPressed: () { //plusknappen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondView()));}, //skickar dig till den andra vyn
          child: Icon(Icons.add, size: 50.0), //ändra storleken på pluset
          backgroundColor: Colors.amber), //ändra färg på knappen
    );
  }
}



  Widget _list() {  
    return ListView(   

/* Denna widget skapar listan. Just nu är den inte riktigt optimal då man måste 
skapa en ny ListTile för varje ny todo. Jag hade velat ha en lista som liknar med Mattias med item, 
men problemet för mig var att checkboxen blev statisk och inte gick att ändra och alla blev antingen false eller true. 
Försökte många olika lösningar men fick inte till det, så jag tar gärna emot tips på en lösning som kan fixa mitt problem :D*/

      children: [ 
        Container(height: 10.0), // använde för att flytta ner listan så att den inte var så nära appbaren
          ListTile(
            leading: Checkbox(activeColor: Colors.amber, //checkboxen med färgen amber när den är i checkad
              value: false,  
                onChanged: (val) {}),
            title: Text('Städa lägenheten'), //min text till listan
            trailing: Icon(Icons.close),  //trailing gör att den lägger sist och sen har vi stängikonen
          ),
          Divider(), //den lägger in en linje mellan raderna i listan

          ListTile(
            leading: Checkbox(activeColor: Colors.amber,
              value: true,
                onChanged: (val) {}),
            title: Text('Vattna växterna', style: TextStyle(decoration: TextDecoration.lineThrough)),
            trailing: Icon(Icons.close),
          ),
          Divider(),      

          ListTile(
            leading: Checkbox(activeColor: Colors.amber,
              value: false,
                onChanged: (val) {}),
            title: Text('Gå på promenad'),
            trailing: Icon(Icons.close),
          ),
          Divider(),

          ListTile(
            leading: Checkbox(activeColor: Colors.amber,
              value: false,
                onChanged: (val) {}),
            title: Text('Tvätta fönster'),
            trailing: Icon(Icons.close),
          ),
          Divider(),

          ListTile(
            leading: Checkbox(activeColor: Colors.amber,
              value: false,
                onChanged: (val) {}),
            title: Text('Handla mat'),
            trailing: Icon(Icons.close),
          ),
          Divider(),
      ],
    );
  }


class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.amber, //ändrar färg på appbaren
        title: Text('Min ToDo', style: TextStyle(color: Colors.white, fontSize: 24.0)), //titeln i AppBaren
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
          Container(
            height: 50.0), //använde container för att flytta ner TextField boxen
          _sizedBox(),
          _flatButton(),
          ], 
        ),
      ), 
    );
  }
} 

  Widget _sizedBox() {
    return SizedBox( 
/*Jag använde SizedBox för att få till storleken på TextField. 
Något jag skulle vilja få till är färgen på borderside och på texten (har kvar koden, men den gör inget).*/ 
      width: 300,
      child: TextField(
        textAlign: TextAlign.center, //sätter texten i mitten
        decoration: InputDecoration(
        border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber)), //funkar inte men ska ändra färg på borderside
        hintText: 'What are you going to do?',
        suffixStyle: const TextStyle(color: Colors.amber)), //funkar inte men ska ändra färg på texten
      ),
    ); 
  }
  
  Widget _flatButton() {
    return FlatButton(
      onPressed: () {},
      child: Text( 
      '+ADD',
      /*Hade från början bara text här, men hittade sen Flatbutton som jag tyckte passade väldigt bra här*/
            
      ),
    );
  }  
          