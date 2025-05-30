import 'package:kino_app/data/remote/remote_source.dart';

class PersonDetailRepository {
  final RemoteSource remoteSource;

  const PersonDetailRepository({required this.remoteSource});

  Future<dynamic> getPersonDetail({int? personId}) async {
    final response = await remoteSource.getPersonDetail(personId: personId);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }
}
