import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:withconi/module/common/controllers/conimal_manage_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import '../../global_widgets/button/wide_button.dart';
import '../theme/text_theme.dart';
import '../../global_widgets/listtile/conimal_list_tile.dart';

class ConimalManagePage extends StatelessWidget {
  const ConimalManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConimalManageController _controller = Get.find();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: WcAppBar(
          title: '',
          onLeadingTap: _controller.getBack,
        ),
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
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '내 코니멀 관리',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Offstage(
                      offstage: _controller.conimalList.isEmpty,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
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
                        ],
                      ),
                    ),
                    Obx((() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: _controller.conimalList.length,
                        itemBuilder: (context, index) {
                          ConimalUIModel thisConimal =
                              _controller.conimalList[index];
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
                                    _controller.onDeleteTap(index);
                                  },
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    _controller.editConimalPage(index);
                                  },
                                  backgroundColor: WcColors.blue80,
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  label: '수정',
                                ),
                              ],
                            ),
                            child: WcConimalListTile(
                              conimal: thisConimal,
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
                        onTap: _controller.addConimalPage,
                        child: Container(
                          alignment: Alignment.center,
                          width: 130,
                          height: 40,
                          child: Text(
                            '코니멀 추가하기',
                            style: GoogleFonts.notoSans(
                                color: WcColors.grey180,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                              color: WcColors.grey80,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Obx(
                    () => WcWideButtonWidget(
                      active: _controller.isButtonValid.value,
                      activeButtonColor: WcColors.blue100,
                      activeTextColor: WcColors.white,
                      buttonText: '수정완료',
                      buttonWidth: WcWidth - 40,
                      onTap: _controller.onEditButtonTap,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
