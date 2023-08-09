import 'package:course_player/src/core/resources/app_colors.dart';
import 'package:course_player/src/core/resources/app_images.dart';
import 'package:course_player/src/core/widgets/row_spacer.dart';
import 'package:course_player/src/features/home/logic/model/model_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatWidget extends StatelessWidget {
  final List<ChatModel> data;
  const ChatWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Row(
            children: [
              data[index].source == 'bot'
                  ? Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(AppImages.robot))),
                    )
                  : Container(),
              const RowSpacer(1),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: data[index].source == 'bot' ? 58 : 0,
                    left: data[index].source != 'bot' ? 58 : 0,
                  ),
                  child: ChatBubble(
                    alignment: data[index].source == 'bot'
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    backGroundColor: data[index].source != 'bot'
                        ? AppColors.yellowColor
                        : AppColors.lightGrayColor,
                    clipper: ChatBubbleClipper4(
                      radius: 10,
                      type: data[index].source != 'bot'
                          ? BubbleType.sendBubble
                          : BubbleType.receiverBubble,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Text(
                        data[index].text,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: data[index].source != 'bot'
                                      ? AppColors.blacColor
                                      : AppColors.whiteColor,
                                ),
                      ),
                    ),
                  ),
                ),
              ),
              data[index].source != 'bot' ? const RowSpacer(1) : Container(),
              data[index].source != 'bot'
                  ? Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(AppImages.profile)),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        itemCount: data.length,
      ),
    );
  }
}
