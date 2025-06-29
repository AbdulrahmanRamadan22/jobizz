// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobizz/features/auth/delet_account/data/repo/delete_repo.dart';
import 'package:jobizz/features/auth/delet_account/logic/cubit/delete_acount_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteRepo deleteRepo;
  DeleteAccountCubit(
    this.deleteRepo,
  ) : super(DeleteAccountState.initial());
  void deleteAccount(String token) async {
    emit(const DeleteAccountState.deleteAccountLoading());
    final result = await deleteRepo.deleteAccount(token);
    result.when(
      success: (data) {
        print('yyyyyyyyyyyyyyyyyy');
        emit(DeleteAccountState.deleteAccountSuccess(data));
      },
      failure: (error) {
        print('nnnnnnnnnnnnn');
        emit(DeleteAccountState.deleteAccountFailure(error));
      },
    );
  }
}
