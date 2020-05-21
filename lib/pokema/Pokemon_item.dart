import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pokemon.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;

  PokemonItem({this.pokemon});





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        elevation: 0.0,
      ),
      backgroundColor: Colors.cyan,
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * .1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 70.0,),
                  Text('Height:${pokemon.height}',style: TextStyle(color: Colors.redAccent,fontSize: 17),),
                  Text('Width:${pokemon.weight}',style: TextStyle(color: Colors.pink,fontSize: 17),),
                  Text('Type',style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type.map((t)=>
                      FilterChip(
                        backgroundColor: Colors.amber,
                        label: Text(t),
                        onSelected: (n){},
                      )
                    ).toList(),
                  ),
                  Text('Weakness',style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pokemon.weaknesses.map((f)=>
                      FilterChip(
                        backgroundColor: Colors.redAccent,
                        label: Text(f),
                        onSelected: (n){},
                      )
                    ).toList(),
                  ),
                  Text('Next Evolution',style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pokemon.nextEvolution == null ? <Widget>[Text('This is the final Evolution')] :
                    pokemon.nextEvolution.map((t)=>FilterChip(
                      backgroundColor: Colors.blue,
                      label: Text(t.name,style: TextStyle(color: Colors.white),),
                      onSelected: (n){},
                    )).toList(),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(pokemon.img)
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
