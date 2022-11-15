import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/community/controllers/community_new_post_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/text_radio_button.dart';

class CommunityNewPostPage extends StatelessWidget {
  CommunityNewPostPage({Key? key}) : super(key: key);

  final CommunityNewPostController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WcAppBar(
        title: '',
        action: Text(
          '남기기',
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
                        text: '${_controller.newPost.value.images.length} ',
                        style: GoogleFonts.workSans(
                            color: WcColors.blue100,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: '/ ${_controller.maxImageNum}',
                        style: GoogleFonts.workSans(
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
                      children: PostType.values
                          .map((postType) => WcTextRadioButton(
                                height: 35,
                                onTap: (value) {
                                  _controller
                                      .onPostTypeChanged(value as PostType);
                                },
                                selectedValue:
                                    _controller.newPost.value.postType,
                                value: postType,
                                text: postType.displayName,
                              ))
                          .toList()),
                ),
              ),
              Obx(
                () => (_controller.newPost.value.images.isNotEmpty)
                    ? Container(
                        height: 110,
                        margin: EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _controller.newPost.value.images.length,
                          itemBuilder: (context, index) {
                            var thisImage =
                                _controller.newPost.value.images[index];
                            return Container(
                              width: 110,
                              height: 110,
                              margin: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: thisImage.getImageByType,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.deleteImage(index);
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      width: 35,
                                      height: 35,
                                      padding: const EdgeInsets.all(0),
                                      child: SvgPicture.asset(
                                        "assets/icons/delete_circle.svg",
                                        color: WcColors.white,
                                        fit: BoxFit.none,
                                        colorBlendMode: BlendMode.modulate,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ))
                    : SizedBox.shrink(),
              ),
              Container(
                width: WcWidth - 40,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: TextField(
                  controller: _controller.contentsTextController,
                  onChanged: _controller.onContentsChanged,
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
