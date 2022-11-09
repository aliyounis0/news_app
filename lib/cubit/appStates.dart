abstract class appStates {}


class initialState extends appStates {}

class getDataLoading extends appStates{}

class getDataSucess extends appStates{}

class getDataErorr extends appStates{
  final error;
  getDataErorr(this.error);
}



