import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../data/state.dart';
import '../../utils/color.dart';

class ShapeCubit extends Cubit<ShapeState> {
  ShapeCubit() : super(const ShapeState.empty());

  void reset() {
    if (state.isEmpty) {
      addError(Exception('Cannot reset from state $state'));
      return;
    }
    emit(const ShapeState.empty());
  }

  void makeCircle() {
    emit(
      ShapeState.circle(
        color: state.color ?? ColorUtils.makeRandomColor(),
      ),
    );
  }

  void makeSquare() {
    emit(
      ShapeState.square(
        color: state.color ?? ColorUtils.makeRandomColor(),
      ),
    );
  }

  void changeColor() {
    if (state.isEmpty) {
      addError(Exception('Cannot changeColor from state $state'));
      return;
    }
    if (state.isCircle) {
      emit(
        ShapeState.circle(
          color: ColorUtils.makeRandomColor(),
        ),
      );
      return;
    }
    if (state.isSquare) {
      emit(
        ShapeState.square(
          color: ColorUtils.makeRandomColor(),
        ),
      );
      return;
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    log('$error $stackTrace');
    super.onError(error, stackTrace);
  }
}
