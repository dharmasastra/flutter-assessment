part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  
  ProfileLoaded(this.profile);
  
  final List<Profile> profile;
  
  @override
  List<Object> get props => [profile];
}

class ProfileError extends ProfileState {
  
  ProfileError(this.message);
  final String message;
  
  @override
  List<Object> get props => [message];
}
