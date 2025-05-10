import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/extensions.dart';


import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/widgets/showdialog_errors.dart';
import '../../../../../core/widgets/showdialog_loadin.dart';
import '../../logic/cubit/sign_up_cubit.dart';
import '../../logic/cubit/sign_up_state.dart';

class GoogleRegisterBlocListener extends StatelessWidget {
  const GoogleRegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is GoogleAuthenticationLoading ||
          current is GoogleAuthenticationSuccess ||
          current is GoogleAuthenticationError,
      listener: (context, state) {
        state.whenOrNull(
          googleAuthenticationLoading: () {
            showDialogLoading(context);
          },
          googleAuthenticationSuccess: (signUpResponse) {
            context.pop();
            context.pushNamed(Routes.layoutScreen);
          },
          googleAuthenticationFailure: (apiErrorModel) {
            context.pop();
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
