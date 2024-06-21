import 'package:nb_utils/nb_utils.dart';

List<WalkThroughModelClass> walkThroughList() {
  List<WalkThroughModelClass> tempList = [];
  tempList.add(
    WalkThroughModelClass(
      title: 'Stay Informed',
      subTitle: 'Keep yourself immediately informed of any emergencies or crises nearby and be vigilant',
      image: 'images/socialv/walkthrough_images/walkthrough_image1.png',
    ),
  );
  tempList.add(
    WalkThroughModelClass(
      title: 'Get Help',
      subTitle: 'Get immediate help from us if you experience personal distress or an emergency by reporting it',
      image: 'images/socialv/walkthrough_images/walkthrough_image2.png',
    ),
  );
  tempList.add(
    WalkThroughModelClass(
      title: 'Security Tips',
      subTitle: 'Emergencies can happen at any time. with this platform, you can never be caught helpless',
      image: 'images/socialv/walkthrough_images/walkthrough_image3.png',
    ),
  );
  return tempList;
}
