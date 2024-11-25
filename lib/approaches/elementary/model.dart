import 'package:elementary/elementary.dart';

import '../../data/state.dart';
import '../../utils/color.dart';

class ElementaryShapeModel extends ElementaryModel {
  ElementaryShapeModel(
    ErrorHandler errorHandler,
  ) : super(errorHandler: errorHandler);

  ShapeState get shape => _shape;
  var _shape = const ShapeState.empty();

  void reset() {
    if (_shape.isEmpty) {
      handleError(Exception('Cannot reset from state $_shape'));
    }
    _shape = const ShapeState.empty();
  }

  void makeCircle() {
    _shape = ShapeState.circle(
      color: ColorUtils.makeRandomColor(),
    );
  }

  void makeSquare() {
    _shape = ShapeState.square(
      color: ColorUtils.makeRandomColor(),
    );
  }

  void changeColor() {
    if (_shape.isEmpty) {
      handleError(Exception('Cannot changeColor from state $_shape'));
    }
    if (_shape.isCircle) {
      _shape = ShapeState.circle(
        color: ColorUtils.makeRandomColor(),
      );
      return;
    }
    if (_shape.isSquare) {
      _shape = ShapeState.square(
        color: ColorUtils.makeRandomColor(),
      );
      return;
    }
  }
}
