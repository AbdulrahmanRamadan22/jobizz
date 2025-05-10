import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/widgets/showdialog_errors.dart';
import '../../../../../core/widgets/showdialog_loadin.dart';
import '../../../../../core/widgets/showdialog_succses.dart';
import '../../logic/cubit/change_password_cubit.dart';
import '../../logic/cubit/change_password_state.dart';


class ChangePasswordBlocListener extends StatelessWidget {
  const ChangePasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          changePasswordLoading: () {
            showDialogLoading(context);
          },
          changePasswordSuccess: (changePasswordResponse) {
            context.pop();
            showSuccessDialog(context).then((_) {
              // ignore: use_build_context_synchronously
              context.pushNamed(Routes.layoutScreen);
            });

            //  context.pushNamed(Routes.layoutScreen);
          },
          changePasswordFailure: (apiErrorModel) {
            context.pop();
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
