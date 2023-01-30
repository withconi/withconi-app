import 'dart:ui';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/theme/text_theme.dart';
import '../controllers/signup_conimal_manage_controller.dart';
import '../../../global_widgets/button/wide_button.dart';
import '../../../global_widgets/listtile/conimal_list_tile.dart';

class SignUpConimalManagePage extends StatelessWidget {
  SignUpConimalManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupConimalManageController _controller = Get.find();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            width: WcWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_controller.userName}님과 함께하는\n코니멀이에요',
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '코니멀 추가 후 회원가입이 가능합니다.',
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontSize: 17,
                            height: 1.7,
                            color: WcColors.grey180,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Offstage(
                      offstage: _controller.conimalList.isEmpty,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          '<<  슬라이드하여 수정할 수 있어요',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 15,
                              height: 1,
                              fontWeight: FontWeight.w400,
                              color: WcColors.grey140),
                        ),
                      ),
                    ),
                    Obx((() => ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
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
                                    _controller.deleteConimal(index);
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
                              conimal: _controller.conimalList[index],
                            ),
                          ),
                        ))),
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
                          width: 138,
                          height: 40,
                          child: Text(
                            '코니멀 추가하기',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                color: WcColors.grey160,
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
                Center(
                  child: Obx(
                    () => WcWideButtonWidget(
                      active: _controller.isButtonValid.value,
                      activeButtonColor: WcColors.blue100,
                      activeTextColor: WcColors.white,
                      buttonText: '다음',
                      buttonWidth: WcWidth(context) - 40,
                      onTap: _controller.goToNextPage,
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
