


import 'package:get/get.dart';

import '../repo/common_repo.dart';
import '../utils/image.dart';

class CommonController extends GetxController implements GetxService {
  final CommonRepo commonRepo;

  CommonController({
    required this.commonRepo,
  });


  int indexTap = 1;
  indexChange(int value){
    indexTap = value;
    update();
  }


  List carList = [false, true, false, false, false, false, false];

  cardLike(int index, bool value){
    carList.removeAt(index);
    carList.insert(index, value);
    update();
  }

}