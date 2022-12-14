import 'package:expensive_chat/shared/ui/app_theme/app_animations/models/app_anim_models.dart';
import 'package:expensive_chat/shared/ui/app_theme/customization/animation/res/data.dart';
import 'package:get/get.dart';

class Anims extends GetxController {
  RxList<AppAnimModels> _animModels = RxList<AppAnimModels>([]);

  List<AppAnimModels> get animModels => _animModels.value;

  AppAnimModels withKey(String key) {
    return _animModels.firstWhere((element) => element.keys[0] == key);
  }

  set updateAnimation(AppAnimModels animModel) {
    _animModels.asMap().forEach((index, value) {
      if (value.keys[0] == animModel.keys[0]) {
        _animModels[index] = animModel;
        _animModels.refresh();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();

    anim_keys.forEach((element) {
      _animModels.add(AppAnimModels(keys: element));
    });
  }
}
