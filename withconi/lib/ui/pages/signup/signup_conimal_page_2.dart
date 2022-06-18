import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import 'package:withconi/ui/widgets/snackbar.dart';
import '../../../controller/signup/signup_conimal_2_controller.dart';

class SignupConimalPage2 extends StatelessWidget {
  SignupConimalPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupConimal2Controller _controller = Get.put(SignupConimal2Controller());

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: WcWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 45,
              ),
              Obx(() {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '${_controller.userName}님과 함께하는\n코니멀이에요',
                    style: GoogleFonts.notoSans(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                );
              }),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(0),

                      // The start action pane is the one at the left or the top side.
                      endActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),

                        // All actions are defined in the children parameter.
                        children: const [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            backgroundColor: WcColors.red100,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: '삭제',
                            onPressed: null,
                          ),
                          SlidableAction(
                            onPressed: null,
                            backgroundColor: Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: '수정',
                          ),
                        ],
                      ),

                      // The end action pane is the one at the right or the bottom side.

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: const ListTile(title: Text('Slide me')),
                    ),
                    Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(1),

                      // The start action pane is the one at the left or the top side.
                      endActionPane: const ActionPane(
                        // A motendActionPaneion is a widget used to control how the pane animates.
                        motion: ScrollMotion(),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            spacing: 7,
                            onPressed: null,
                            backgroundColor: WcColors.red100,
                            foregroundColor: Colors.white,
                            icon: Icons.delete_rounded,
                            label: '삭제',
                          ),
                          SlidableAction(
                            onPressed: null,
                            backgroundColor: WcColors.blue80,
                            foregroundColor: Colors.white,
                            icon: Icons.mode_edit_rounded,
                            label: '수정',
                          ),
                        ],
                      ),

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 75,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/cat.png',
                                height: 43,
                                alignment: Alignment.centerLeft,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  '춘복이',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                width: 35,
                                child: Row(children: [
                                  Text(
                                    '3',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '살',
                                    style: GoogleFonts.notoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                              ),
                              Expanded(
                                  flex: 7,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '갑상선 기능 항진증',
                                          style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline:
                                              TextBaseline.ideographic,
                                          children: [
                                            Text(
                                              '+2',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '개 질병',
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ])),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
