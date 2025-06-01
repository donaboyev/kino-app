import 'dart:developer';

import 'package:kino_app/data/response/person_detail.dart';

import '../data/repository/repositories.dart';
import 'base_controller.dart';

class PersonDetailController extends BaseController {
  final PersonDetailRepository repository;

  PersonDetailController({required this.repository});

  PersonDetail? _personDetail;
  int? _personId;

  void setPersonId(int? value) async {
    _personId = value;
    await getPersonDetail();
  }

  Future<void> getPersonDetail() async {
    setLoading(true);
    final result = await repository.getPersonDetail(personId: _personId);
    setLoading(false);
    if (result is PersonDetail) {
      _personDetail = result;
      update();
    } else {
      log('===================> error: $result');
    }
  }

  PersonDetail? get person => _personDetail;
}
