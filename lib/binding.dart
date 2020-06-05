import 'package:get/get.dart';

import 'controller.dart';
import 'getx.dart';

class Setup extends Bindings {
  @override
  void dependencies() {
    /// inicialização
    print('carregando os controles');
    Get.lazyPut<Controller>(() => Controller(0));
    //Get.put<Controller>(Controller(0));
    Get.lazyPut<ControllerX>(() => ControllerX(0));
  }
}
