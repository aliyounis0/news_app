
import 'package:app_news/cubit/appCubit.dart';
import 'package:app_news/cubit/appStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/components.dart';



class homeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context )=>appCubit()..getArticles(),
      child: BlocConsumer<appCubit,appStates>(
        listener: (context ,state ){},
        builder: (context, state){
          var cubit =appCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News") ,
            ),
            body:ConditionalBuilder(
              condition: state !=getDataLoading,
              builder: (context)=>builderItem(cubit.article,context),
              fallback: (context)=>Center(child: CircularProgressIndicator()),
            )
            );
        },
      ),
    );

  }
}


