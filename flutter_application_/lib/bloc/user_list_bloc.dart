import 'package:bloc/bloc.dart';
import 'package:flutter_application_/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';
part 'user_list_bloc.freezed.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(const _Initial()) {
    on<UserListEvent>((event, emit) {
      state.when(
          initial: () => UserListState.initial(),
          loading: () => UserListState.loading(),
          loaded: (userList) {});
    });
  }
}
