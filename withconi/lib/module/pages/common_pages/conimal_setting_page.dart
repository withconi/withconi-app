import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:withconi/controller/common_controller/conimal_manage_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/widgets/appbar/appbar.dart';
import '../../../data/model/conimal.dart';
import '../../theme/text_theme.dart';
import '../../widgets/listtile/conimal_list_tile.dart';

class ConimalSettingPage extends StatelessWidget {
  const ConimalSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConimalManageController _controller = Get.put(ConimalManageController());
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: WcAppBar(title: ''),
        body: SafeArea(
          child: SizedBox(
            width: WcWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '내 코니멀 관리',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        '<<  슬라이드하여 수정할 수 있어요',
                        style: GoogleFonts.notoSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: WcColors.grey140),
                      ),
                    ),
                    Obx((() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: _controller.conimalList.length,
                        itemBuilder: (context, index) {
                          Conimal thisConimal = _controller.conimalList[index];
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: WcColors.red100,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: '삭제',
                                  onPressed: (context) {
                                    _controller.onDeleteTap(
                                        conimalId: thisConimal.conimalId);
                                  },
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    _controller.editConimal(index);
                                  },
                                  backgroundColor: WcColors.blue80,
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  label: '수정',
                                ),
                              ],
                            ),
                            child: WcConimalListTile(
                              age: _controller.calculateConimalAge(index),
                              diseaseName: _getThisConimalName(thisConimal),
                              diseaseNum: thisConimal.diseases.length,
                              name: thisConimal.name,
                              species: thisConimal.species,
                            ),
                          );
                        }))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => Visibility(
                    visible: _controller.conimalList.length < 3,
                    child: Center(
                      child: GestureDetector(
                        onTap: _controller.addConimal,
                        child: Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          child: Text(
                            '더 추가하기',
                            style: GoogleFonts.notoSans(
                                color: WcColors.grey200,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                              color: WcColors.grey60,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getThisConimalName(Conimal conimal) {
    if (conimal.diseases.isNotEmpty) {
      return conimal.diseases[0].name;
    } else {
      return '질병 없음';
    }
  }
}
