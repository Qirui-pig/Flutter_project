import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_test/pokema/Pokemon_item.dart';
import './pokemon.dart';

main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();
//  print('1');
    _fetchData();
  }

  _fetchData  ()async{
    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodeJson);
//    print(pokeHub);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokemon'),backgroundColor: Colors.cyan,),
      body: pokeHub == null ? Center(child: CircularProgressIndicator(),):
            GridView.count(
              crossAxisCount: 2,
              children: pokeHub.pokemon.map((poke)=>Padding(
                padding: EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>PokemonItem(
                        pokemon:poke,
                      )
                    ));
                  },
                  child: Hero(
                    tag: poke.img,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(poke.img)
                              )
                            ),
                          ),
                          Text(poke.name,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
              )).toList(),
            ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

