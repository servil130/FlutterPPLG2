import 'dart:convert';

import 'package:fluttercoba/model/team_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TeamController extends GetxController {
  final teams = <TeamModel>[].obs;
  final isLoading = false.obs;
  final errorMsg = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    try {
      isLoading.value = true;
      errorMsg.value = '';

      final url = Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English_Premier_League",
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final list = (data['teams'] as List?) ?? [];
        teams.value = list
            .map((e) => TeamModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        errorMsg.value = "Gagal memuat data (${response.statusCode})";
      }
    } catch (e) {
      errorMsg.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}