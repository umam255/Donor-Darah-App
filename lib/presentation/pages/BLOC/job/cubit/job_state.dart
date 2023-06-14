part of 'job_cubit.dart';

class JobState extends Equatable {
  const JobState();

  @override
  List<Object> get props => [];
}

class JobInitial extends JobState {}

class JobIsLoading extends JobState {}

class JobIsLoaded extends JobState {}

class JobIsSucces extends JobState {
  final JobData data;

  const JobIsSucces({required this.data});
}

// ignore: must_be_immutable
class JobIsFailed extends JobState {
  String? message;

  JobIsFailed({this.message});
}
