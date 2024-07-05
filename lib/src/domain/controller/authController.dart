import 'package:broker/src/domain/repository/authRepo.dart';
import 'package:get/get.dart';


class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

}