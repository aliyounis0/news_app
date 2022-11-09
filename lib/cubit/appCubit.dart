
import 'package:app_news/cubit/appStates.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_news/network/remote/dio_helper.dart';




class appCubit extends Cubit<appStates>
{
  appCubit():super(initialState());
  static appCubit get(context) => BlocProvider.of(context);

  List<dynamic> article=[];

  void getArticles ()
  {
    emit(getDataLoading());
    dioHelper.getData(
        url: 'v2/everything',
        query:
        {
          "q":"Apple",
          "from":"2022-11-06",
          "sortBy":"popularity",
          "apiKey":"9fe8f413700043eeb880340fda793688",
        }
    ).then((value)
    {
      article=value.data["articles"];
      print(article.toString());
      emit(getDataSucess());
    }).catchError((error)
    {
      print(error.toString());
      emit(getDataErorr(error));
    });
  }
}

