import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/data/model/diseases.dart';
import 'package:withconi/data/provider/auth_api.dart';
import 'package:withconi/data/provider/disease_api.dart';

class DiseaseSearchRepository {
  final DiseaseAPI _api = DiseaseAPI();

  Future<List<DiseaseModel>> getDiseaseList(
      {required String diseaseName}) async {
    print('repository 질병 리스트 요청 전');
    var list = await _api.getDiseaseList(
        diseaseName: diseaseName, page: 1, listSize: 6);
    return list;
  }
}
