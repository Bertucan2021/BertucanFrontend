import 'package:bertucanfrontend/Local_database/sqlite.dart';
import 'package:bertucanfrontend/bloc/cycle/cycle_event.dart';
import 'package:bertucanfrontend/bloc/cycle/cycle_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:equatable/equatable.dart';

class CycleBloc extends Bloc<CycleEvent, CycleState> {
  CycleBloc() : super(CycleInitialState()) {
    on<GetDateBasedPhase>((event, emit) async {
      emit(CycleLoadingState());
      try {
        final LogPeriod2 cycleday = await dogs();
        final DateTime today = cycleday.startDate;
        final Duration difference = event.date.difference(today);
        int diff = today.day!=(event.date.day)%28? (difference.inDays )%28+1: (difference.inDays)%28;
        if (0 <= diff && diff <= 5) {
          emit(CycleSuccessState(phase: 'Menstrual Phase', day: diff, chanceOfPregnancy: 'LOW'));
        }
        else if (6 <= diff && diff <= 12) {
          emit(CycleSuccessState(phase: 'Follicular Phase', day: diff, chanceOfPregnancy: 'High'));
        }
        else if (13 <= diff && diff <= 17) {
          emit(CycleSuccessState(phase: 'Ovulation Phase', day: diff, chanceOfPregnancy: 'Ideal'));
        }
        else if (18 <= diff && diff <= 28) {
          emit(CycleSuccessState(phase: 'Luteal Phase', day: diff, chanceOfPregnancy: 'LOW'));
        }
      } catch (e) {
        emit(const CycleErrorState(statusCode: 404));
      }
    });
  }
  
  }

  @override
  Stream<CycleState> mapEventToState(CycleEvent event) async*{
    if (event is GetTodayCyclePhase){
      yield CycleLoadingState();
      try{
          final today = DateTime.now();
          yield CycleTodayState(today: today);
      } catch (e){
        yield const CycleErrorState(statusCode: 404);
      }
    }
    else if(event is GetDateBasedPhase){
      yield CycleLoadingState();
      try{
        final today = DateTime.now();
        Duration difference = today.difference(event.date);
        if (0<=difference.inDays && difference.inDays<= 5){
          yield CycleSuccessState(phase: 'Menstrual Phase', day: difference.inDays, chanceOfPregnancy: 'LOW');
        }
        else if( 6<= difference.inDays && difference.inDays <= 12){
          yield CycleSuccessState(phase: 'Follicular Phase', day: difference.inDays, chanceOfPregnancy: 'HIGH');
        }
        else if( 13<= difference.inDays && difference.inDays <= 17){
          yield CycleSuccessState(phase: 'Ovulation Phase', day: difference.inDays, chanceOfPregnancy: 'Ideal');
        }
        else if( 18<= difference.inDays && difference.inDays <= 28){
          yield CycleSuccessState(phase: 'Luteal Phase', day: difference.inDays, chanceOfPregnancy: 'LOW');
        }
      } catch(e){
        yield const CycleErrorState(statusCode: 404);
      }
    }

}

