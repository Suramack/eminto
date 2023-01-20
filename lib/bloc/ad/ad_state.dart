part of 'ad_bloc.dart';

abstract class AdState extends Equatable {
  const AdState();
  
  @override
  List<Object> get props => [];
}

class AdInitial extends AdState {}
