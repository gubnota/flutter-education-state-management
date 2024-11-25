import 'package:get/state_manager.dart';

import '../../data/state.dart';
import '../../utils/color.dart';

class GetxShapeController extends GetxController {
  final state = const ShapeState.empty().obs;

  void reset() {
    if (state.value.isEmpty) {
      throw Exception('Cannot reset from state $state');
    }
    state.value = const ShapeState.empty();
  }

  void makeCircle() {
    state.value = ShapeState.circle(
      color: state.value.color ?? ColorUtils.makeRandomColor(),
    );
  }

  void makeSquare() {
    state.value = ShapeState.square(
      color: state.value.color ?? ColorUtils.makeRandomColor(),
    );
  }

  void changeColor() {
    if (state.value.isEmpty) {
      throw Exception('Cannot changeColor from state $state');
    }
    if (state.value.isCircle) {
      state.value = ShapeState.circle(
        color: ColorUtils.makeRandomColor(),
      );
      return;
    }
    if (state.value.isSquare) {
      state.value = ShapeState.square(
        color: ColorUtils.makeRandomColor(),
      );
      return;
    }
  }
}
