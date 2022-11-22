import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_/models/user/user.dart';
import 'package:flutter_application_/services/ApiService.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';
part 'user_list_bloc.freezed.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  // final ApiService apiService;
  // @override
  // Stream<UserListState> mapEventToState(UserListEvent event) async* {
  //   event.when(
  //     loadData: () async* {
  //       const Text('LoadData');
  //     },
  //     tapOnUserFromList: () async* {
  //       const Text('TapOnUserFromList');
  //     },
  //   );
  // }

  UserListBloc() : super(const _Initial()) {
    on<UserListEvent>((event, emit) async {
      // state.when(
      //     initial: () => const UserListState.initial(),
      //     loading: () => const UserListState.loading(),
      //     loaded: () {});

      if (event is _LoadData) {
        const UserListState.loading();
        // try {
        //   final List<User>? users = await apiService.fetchUsers();
        //   UsersState.data(users ?? []);
        //   print(UsersState.data(users ?? []));
        // } catch (e) {
        //   const UsersState.error();
        // }
      } else {}
    });
  }
}
