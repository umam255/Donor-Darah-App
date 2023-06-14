part of 'village_cubit.dart';

class VillageState extends Equatable {
  const VillageState();

  @override
  List<Object> get props => [];
}

class VillageInitial extends VillageState {}

class VillageIsLoading extends VillageState {}

class VillageIsLoaded extends VillageState {}

class VillageIsSucces extends VillageState {
  final VillageData data;

  const VillageIsSucces({required this.data});
}

// ignore: must_be_immutable
class VillageIsFailed extends VillageState {
  String? message;

  VillageIsFailed({this.message});
}
