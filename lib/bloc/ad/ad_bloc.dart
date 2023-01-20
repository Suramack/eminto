import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ad_event.dart';
part 'ad_state.dart';

class AdBloc extends Bloc<AdEvent, AdState> {
  AdBloc() : super(AdInitial()) {
    on<AdEvent>((event, emit) {});
  }
}
