import '../remote/remote_source.dart';

class PeopleMoreRepository {
  final RemoteSource remoteSource;

  const PeopleMoreRepository({required this.remoteSource});

  Future<dynamic> getTrendingPeople({required int page}) async {
    final response = await remoteSource.getTrendingPersons(page: page);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }
}
