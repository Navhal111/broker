import 'package:broker/src/domain/repository/common_repo.dart';
import 'package:get/get.dart';

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