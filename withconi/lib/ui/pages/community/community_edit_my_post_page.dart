import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/community/community_edit_my_post_controller.dart';
import 'package:withconi/controller/community/community_new_post_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/button/text_radio_button.dart';

class CommunityEditMyPostPage extends StatelessWidget {
  CommunityEditMyPostPage({Key? key}) : super(key: key);

  final CommunityEditMyPostController _controller =
      Get.put(CommunityEditMyPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WcAppBar(
        title: '내 글 수정',
        action: Text(
          '수정하기',
          style: GoogleFonts.notoSans(
              fontSize: 16,
              color: WcColors.blue100,
              fontWeight: FontWeight.bold),
        ),
        leading: SvgPicture.asset(
          'assets/icons/arrow_back.svg',
          color: WcColors.grey200,
        ),
        onActionTap: _controller.onCreateButtonTap,
        onLeadingTap: _controller.getBack,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Obx(
                () => Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${_controller.selectedImageNum.value} ',
                        style: GoogleFonts.montserrat(
                            color: WcColors.blue100,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: '/ ${_controller.maxImageNum}',
                        style: GoogleFonts.montserrat(
                            color: WcColors.grey180,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              margin: const EdgeInsets.only(right: 10),
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: WcColors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(30, 0, 0, 0),
                      blurRadius: 6,
                      spreadRadius: -1),
                ],
              ),
            ),
            FloatingActionButton(
              focusElevation: 0,
              highlightElevation: 2,
              elevation: 0,
              backgroundColor: Colors.white,
              onPressed: _controller.pickMultipleImageFiles,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(50, 0, 0, 0),
                        blurRadius: 9,
                        spreadRadius: -1),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/icons/picture.svg',
                  width: 60,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: WcColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20, bottom: 14),
                child: Text(
                  '어떤 코니멀과 관련된 글인가요?',
                  style: GoogleFonts.notoSans(
                      color: WcColors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Obx(
                () => Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Row(
                      children: _controller.postType
                          .map((postType) => WcTextRadioButton(
                                height: 35,
                                onTap: () {
                                  _controller.onPostTypeChanged(postType);
                                },
                                selectedValue: postType.displayName,
                                value: postType.displayName,
                              ))
                          .toList()),
                ),
              ),
              Obx(
                () => (_controller.selectedImageNum.value > 0)
                    ? Container(
                        height: 135,
                        margin: EdgeInsets.only(left: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _controller.imageItemList
                                .map(
                                  (image) => Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(children: [
                                        Container(
                                          width: 110,
                                          height: 110,
                                          foregroundDecoration:
                                              const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(70, 21, 12, 12),
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              stops: [0, 0.3],
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: image.toImageByType()),
                                          ),
                                        ),
                                        Positioned(
                                            right: -7,
                                            top: -7,
                                            child: GestureDetector(
                                              onTap: () {
                                                _controller.deleteImage(image);
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 50,
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: SvgPicture.asset(
                                                  "assets/icons/delete_circle.svg",
                                                  color: WcColors.grey60,
                                                  fit: BoxFit.none,
                                                ),
                                              ),
                                            )),
                                      ]),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              Container(
                width: WcWidth - 40,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: TextField(
                  controller: _controller.textController,
                  style: GoogleFonts.notoSans(
                      color: WcColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                  maxLines: 100,
                  minLines: 20,
                  decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.notoSans(
                          color: WcColors.grey120,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.5),
                      hintText:
                          '욕설, 비방 등 상대방을 불쾌하게 하는 의견은 남기지 말아주세요. 신고를 당하면 커뮤니티 이용이 제한될 수 있습니다.'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
