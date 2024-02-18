
abstract class AuthRemoteDataSource {

  Future login({required String email, required String password});

  Future register({required String username,required String email,required String password});


}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  @override
  Future login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future register({required String username, required String email, required String password}) {
    // TODO: implement registerBuyer
    throw UnimplementedError();
  }



}