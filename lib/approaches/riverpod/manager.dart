import 'package:riverpod/riverpod.dart';

import '/data/state.dart';
import '../../utils/color.dart';

class ShapeRiverpodProvider extends StateNotifier<ShapeState> {
  ShapeRiverpodProvider() : super(const ShapeState.empty());

  void reset() {
    if (state.isEmpty) {
      throw Exception('Cannot reset from state $state');
    }
    state = const ShapeState.empty();
  }

  void makeCircle() {
    state = ShapeState.circle(
      color: state.color ?? ColorUtils.makeRandomColor(),
    );
  }

  void makeSquare() {
    state = ShapeState.square(
      color: state.color ?? ColorUtils.makeRandomColor(),
    );
  }

  void changeColor() {
    if (state.isEmpty) {
      throw Exception('Cannot changeColor from state $state');
    }
    if (state.isCircle) {
      state = ShapeState.circle(
        color: ColorUtils.makeRandomColor(),
      );
    } else if (state.isSquare) {
      state = ShapeState.square(
        color: ColorUtils.makeRandomColor(),
      );
    }
  }
}
