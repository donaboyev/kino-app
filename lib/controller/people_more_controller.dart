import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kino_app/data/response/person_response.dart';

import '../data/repository/repositories.dart';
import 'base_controller.dart';

class PeopleMoreController extends BaseController {
  final PeopleMoreRepository repository;

  PeopleMoreController({required this.repository});

  ScrollController? scrollController;

  final List<Person> _people = [];
  int? _totalPeoplePage = 1;
  int _peoplePage = 1;
  bool _hasNextPeople = true;
  final RxBool _isPeopleLoading = false.obs;

  @override
  void onInit() async {
    await getTrendingPeople();
    scrollController = ScrollController();
    scrollController!.addListener(() {
      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        getTrendingPeople();
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  Future<void> getTrendingPeople() async {
    if (!_hasNextPeople) return;
    if (_peoplePage == 1) {
      setLoading(true);
    } else {
      _isPeopleLoading.value = true;
    }
    final result = await repository.getTrendingPeople(page: _peoplePage);
    _isPeopleLoading.value = false;
    setLoading(false);
    if (result is PersonResponse) {
      _totalPeoplePage = result.totalPages;
      _peoplePage++;
      if (_peoplePage > _totalPeoplePage!) _hasNextPeople = false;
      _people.addAll(result.people!);
      update();
    } else {
      log('===================> error: $result');
    }
  }

  List<Person> get people => _people;

  RxBool get isPeopleLoading => _isPeopleLoading;
}
