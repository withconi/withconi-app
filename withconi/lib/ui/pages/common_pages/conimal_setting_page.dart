import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:withconi/controller/common_controller/conimal_manage_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import '../../widgets/button/wide_button.dart';
import '../../widgets/listtile/conimal_list_tile.dart';

class ConimalSettingPage extends StatelessWidget {
  ConimalSettingPage({Key? key}) : super(key: key);

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
                    style: GoogleFonts.notoSans(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx((() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.conimalList.length,
                      itemBuilder: (context, index) => Slidable(
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
                                    conimalId: _controller
                                        .conimalList[index].conimalId);
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
                          diseaseName: (_controller
                                  .conimalList[index].diseases.isNotEmpty)
                              ? _controller.conimalList[index].diseases[0].name
                                  .substring(0, 10)
                              : '질병 없음',
                          diseaseNum: (_controller
                                      .conimalList[index].diseases.length >
                                  1)
                              ? _controller.conimalList[index].diseases.length
                              : null,
                          name: _controller.conimalList[index].name,
                          species: _controller.conimalList[index].species,
                        ),
                      ),
                    ))),
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
                SizedBox(
                  height: 50,
                ),
                // Center(
                //   child: Obx(
                //     () => WcWideButtonWidget(
                //       active: _controller.isButtonValid.value,
                //       activeButtonColor: WcColors.blue100,
                //       activeTextColor: WcColors.white,
                //       buttonText: '수정완료',
                //       buttonWidth: WcWidth - 40,
                //       onTap: _controller.updateConimalList,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
