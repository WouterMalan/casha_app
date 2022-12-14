import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'simple_calc_state.dart';

class SimpleCalcCubit extends Cubit<SimpleCalcState> {
  SimpleCalcCubit() : super(SimpleCalcCalculated({}, 0));

  List<num> validDenominations = [200,100, 50, 20, 10, 5, 2, 1, 0.5, 0.2];

  void calculateWithMod(double? cost, double? tender) {
    if (cost == null || tender == null) return;

    num totalChange = tender - cost;
    num newTotalChange = tender - cost;
    Map<String, num> breakdown = {};

    // TODO - Calculate your breakdown here, put the results in a map, with the validDenominations as the key, and the result as the value
    for (num denomination in validDenominations) {
      if (totalChange >= denomination) {
        num numOfDenomination = totalChange ~/ denomination;
        breakdown[denomination.toString()] = numOfDenomination;
        totalChange -= numOfDenomination * denomination;
      }
    }


    emit(SimpleCalcCalculated(breakdown, newTotalChange));
  }

  void clearAll() {
    emit(SimpleCalcCalculated({}, 0));
  }
}
