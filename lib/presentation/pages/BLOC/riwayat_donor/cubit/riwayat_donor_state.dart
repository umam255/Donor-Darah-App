part of 'riwayat_donor_cubit.dart';

class RiwayatDonorState extends Equatable {
  const RiwayatDonorState();

  @override
  List<Object> get props => [];
}

class RiwayatDonorInitial extends RiwayatDonorState {}

class RiwayatDonorIsLoading extends RiwayatDonorState {}

class RiwayatDonorIsLoaded extends RiwayatDonorState {}

class RiwayatDonorIsSucces extends RiwayatDonorState {
  final RiwayatDonorData data;

  const RiwayatDonorIsSucces({required this.data});
}

// ignore: must_be_immutable
class RiwayatDonorIsFailed extends RiwayatDonorState {
  String? message;

  RiwayatDonorIsFailed({this.message});
}
