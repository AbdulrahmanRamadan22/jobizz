import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/widgets/showdialog_errors.dart';
import '../../../../../core/widgets/showdialog_loadin.dart';
import '../../logic/cubit/forget_pass_cubit.dart';
import '../../logic/cubit/forget_pass_state.dart';


class ForgetPassBlocListener extends StatelessWidget {
  const ForgetPassBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPassCubit, ForgetPassState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialogLoading(context);
          },
          success: (forgetPassResponse, email) {
            context.pop();
            context.pushNamed(
              arguments: email,
              Routes.otpScreen,
            );
          },
          failure: (apiErrorModel) {
            context.pop();
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
