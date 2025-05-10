import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/widgets/showdialog_errors.dart';
import '../../../../../core/widgets/showdialog_loadin.dart';
import '../../logic/cubit/resetpassword_cubit.dart';
import '../../logic/cubit/resetpassword_state.dart';


class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialogLoading(context);
          },
          success: (response) {
            context.pop();
            context.pushNamed(Routes.resetPasswordConformationScreen);
          },
          error: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
