import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:pageview_test/food/core/model/cate_model.dart';

import 'package:pageview_test/food/core/services/json_parse.dart';

import 'package:pageview_test/food/core/extension/int_extension.dart';
import 'package:pageview_test/food/ui/shared/size_fit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: HomeContent(),
      drawer: Drawer(),
    );
  }
}

class HomeContent extends StatefulWidget {

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List <CateModel> _cateList = [];


  @override
  void initState() {
    super.initState();
    JsonParse.getCateData().then((res){
      setState(() {
        _cateList = res;
      });
    });

    //一定要记住initial一下 否者全是null
    SizeFit.initialize();
  }


  @override
  Widget build(BuildContext context) {

    return GridView.builder(
        padding: EdgeInsets.all(10.px),
        itemCount: _cateList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.px,
          mainAxisSpacing: 20.px,
          childAspectRatio: 1.5
        ),
        itemBuilder: (ctx,index){
          final bgColor = _cateList[index].cColor;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:bgColor,
              gradient: LinearGradient(
                colors: [
                  bgColor.withOpacity(0.5),
                  bgColor
                ]
              )
            ),
            alignment: Alignment.center,
            child: Text('${_cateList[index].title}',style: Theme.of(context).textTheme.display3.copyWith(
              fontWeight: FontWeight.bold,fontSize: 20
            ),),
          );
        }
    );
  }
}

