part of 'district_cubit.dart';

class DistrictState extends Equatable {
  const DistrictState();

  @override
  List<Object> get props => [];
}

class DistrictInitial extends DistrictState {}

class DistrictIsLoading extends DistrictState {}

class DistrictIsLoaded extends DistrictState {}

class DistrictIsSucces extends DistrictState {
  final DistrictData data;

  const DistrictIsSucces({required this.data});
}

// ignore: must_be_immutable
class DistrictIsFailed extends DistrictState {
  String? message;

  DistrictIsFailed({this.message});
}
