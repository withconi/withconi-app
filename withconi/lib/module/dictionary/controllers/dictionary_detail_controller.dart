import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/joined_dto/symptom.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/board_response_dto.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';

import '../../../import_basic.dart';
import '../../community/pages/community_setting_page.dart';
import '../../../global_widgets/dialog/disease_editing_dialog.dart';
import '../../auth/auth_controller.dart';

class DictionaryDetailController extends GetxController {
  DictionaryDetailController(this._conimalRepository);
  final ConimalRepository _conimalRepository;
  // CommunityRepository _communityRepository = Get.find();
  RxList<BoardResponseDTO> _boardList = RxList<BoardResponseDTO>();
  List<BoardResponseDTO> get boardList => _boardList.toList();
  late DiseaseUIModel disease;
  RxBool isDiseaseManaged = false.obs;
  RxList<ConimalUIModel> _conimalList = RxList<ConimalUIModel>();

  @override
  onInit() {
    super.onInit();
    disease = (Get.arguments as DiseaseUIModel).copyWith();
//     disease = DiseaseUIModel(
//         advice: '환축은 평생동안 치료받아야함을 이해시킴. 때때로 피부병변이 치료 시작하고 한달정도는 더 나빠질 수 있음을 경고',
//         code: disease.code,
//         definition: '''갑상선에서 T3, T4의 부적절한 생산, 분비로 세포대사활성 및 행동기능의 저하가 초래되는 질환''',
//         diagnosisTechnique:
//             '[CBC, 혈액화학치, 뇨검사]\n고콜레스테롤혈증-갑상선기능저하증을 갖는 개의 80% 이상에서 발견\n과중성지방혈증과 지방혈증\n경도의 정색소성, 정세포성, 비재생성 빈혈-갑상선기능저하증을 갖는 개의 50% 이상에서 발견\n혈청내 creatine kinase 수치가 약간 올라감\n[혈청내 갑상선 호르몬 농도] \n 혈청내 T4 수준이 정상이거나 약간 높으면 갑상선기능저하증은 제외 \n→ 더이상의 내분비 검사는 필요없음 갑상선에는 이상이 없는 환축에서도 T4 수준이 내려갈 수 있음 (sick euthyroid syndrome) → 갑상선 호르몬을 제공해줄 필요 없음. 혈청내 T3 수준은 갑상선의 기능을 판단하는데 적합하지 않음 - 갑상선기능저하증을 앓는 개의 74%에서 정상 T3수준을 보였다는 보고, 정상 갑상선 기능을 갖는 환축에서 T3 수준이 약간 비정상인 경우도 있음. 개에서 현저한 T4, T3 수준의 증가는 갑상선 호르몬에 대한 자가항체의 존재를 의미함\n이 자가항체는 방사선면역측정법에서 T3나 T4 농도의 위상승(false elevation)이나 드물게 위저하의 결과를 야기할 수 있음\n평형투석에 의한 FT4 수준은 갑상선기능저하증을 진단하는데 민감하고 특이적인 방법임\n적절한 임상증상과 낮은 FT4 농도는 갑상선기능저하증을 나타냄. 단, 갑상선 기능은 정상이지만 부신피질기능항진증을 앓는 개의 25% 이상에서 FT4 농도가 낮음\n[내인성 갑상선자극호르몬(TSH)의 농도]\n갑상선자극호르몬은 원발성 갑상선기능저하증을 앓는 대부분의 개에서 증가(그러나 갑상선기능저하증을 앓는 개의 18-38%에서 정상 TSH 농도를 보임)\nT4나 FT4 농도는 낮으나 TSH 농도가 높은 동물은 갑상선기능저하증일 가능성 높음\n갑상선 호르몬과 Tg에대한 자가항체 Tg나 T3, T4에 대한 자가항체는 갑상선기능저하증에서 흔히 나타남.단, 갑상선기능이 정상인 건강한 동물에서도 나타날 수 있음\n갑상선 이외의 내분비장애를 갖는 환축의 43% 이상에서 Tg에 대한 자가항체가 발견됨\n[TSH 자극 시험]\n갑상선기능저하증을 진단하는 표준\n외인성 TSH를 환축에 투여하고 투여전과 투여후의 혈청내 T4농도 측정\n갑상선기능저하증인 경우 TSH 투여후의 혈청내 T4농도가 정상수준으로 올라가지 않고 일반적으로 TSH 투여전의 T4농도를 초과하지 않음\n중증의 정상갑상선기능 증후군, 초기 원발성 또는 속발성 갑상선기능저하증의 환축에서는 TSH에 대해 약화된 반응을 보임',
//         diseaseType: DiseaseType.endocrinology,
//         name: '갑상선기능저하증(Hypothyroidism)',
//         symptomGroup: [
//           SymptomGroup(
//               symptomType: Symptom.action,
//               symptomList: ['절뚝거림', '식욕감소', '무기력']),
//           SymptomGroup(
//               symptomType: Symptom.skin,
//               symptomList: ['두꺼운 피부', '피부부종', '털 건조함'])
//         ],
//         treatment: '''#식이요법-체중과 T4 농도가 정상으로 될 때까지 지방 섭취를 제한
// # 원발성 갑상선기능저하증 환축은 합성 levothyroxine(L-thyroxine)을
//   경구투여하면 치료효과 좋음
// # levothyroxine이 특효약
// # 초기 치료용량은 0.02-0.04mg/kg/day 또는 0.5mg/㎡/day 용량을 하루에 두번으로 나누어서 투여
// # 혈청중 T4 농도와 치료에 대한 환축의 반응 등을 고려하여 치료용량 결정
// # 심부전이나 당뇨병, 신부전, 간질환, 부신피질기능저하증이 있는
//   환축에는 초기 levothyroxine의 용량을 적게해야함
// # 부신피질기능저하증을 갖는 갑상선기능저하증 환축에는 levothyroxine
//   치료전에 glucocorticoid를 공급
// # glucocorticoids, phenytoin, salicylates, androgens, furosemide는 혈청 단백질의 결합을 방해해서 L-thyroxine 대사를 증가시킴
// # sucralfate, aluminum hydroxide는 위장관에서 L-thyroxine의 흡수를 방해
// # liothyronine(합성 T3): 적어도 2가지 이상의 L-thyroxine으로 치료해보고 정상 혈청 T4 농도에  도달하지 못했을 때만 사용, 거의 대부분이 위에서 흡수됨, 초기 용량은 4-6mg/kg으로 하루에 세번으로 나누어 경구투여, 환축의 치료에대한 반응과 혈청 T3 농도에 따라 치료용량 결정''');
    if (AuthController.to.isUserValid) {
      _conimalList.assignAll(AuthController.to.userInfo.conimals.toList());
      isDiseaseManaged.value = _checkDiseaseMangingStatus();
    }
  }

  onDiseaseManagementChanged() async {
    await AuthController.to.setDbUserInfo();
    isDiseaseManaged.value = _checkDiseaseMangingStatus();
    return;
  }

  bool _checkDiseaseMangingStatus() {
    _conimalList.assignAll(AuthController.to.userInfo.conimals.toList());
    return _conimalList.any((conimal) {
      bool managingDisease =
          conimal.diseases.any((element) => element.code == disease.code);
      return managingDisease;
    });
  }

  _updateConimalDisease(List<ConimalUIModel> editedConimals) async {
    for (ConimalUIModel conimal in editedConimals) {
      print('🐶 질병을 변경하려는 코니멀  => $conimal');
      print('🦠 코니멀의 질병 리스트  => ${conimal.diseases}');

      await _conimalRepository.updateConimalDisease(
        diseases: conimal.diseases,
        conimalId: conimal.conimalId,
      );
    }
    await onDiseaseManagementChanged();
  }

  editConimalDiseases(BuildContext context) async {
    var editedConimal = await showDiseaseEditDialog(
        originalList: _conimalList.toList(),
        context: context,
        currentDisease: disease.copyWith());

    if (editedConimal != null) {
      await showLoading(() => _updateConimalDisease(editedConimal));
    }
  }

  // toBoardDetailPage({required String boardId}) {
  //   Get.toNamed(Routes.COMMUNITY_POST_LIST, arguments: boardId);
  // }

  // toSettingPage() {
  //   Get.to(CommunitySettingPage());
  // }
}
