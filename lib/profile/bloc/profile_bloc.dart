import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app1/profile/models/profile.dart';
import 'package:flutter_app1/profile/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository = ProfileRepository();
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchFeaturedProfile>(_onFetchFeaturedProfile);
  }
  Future<void> _onFetchFeaturedProfile(
    FetchFeaturedProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await repository.getProfile();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError('Failed to load products: $e'));
    }
  }
}