import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/auth/otp_screen/logic/cubit/otp_state.dart';

import '../../../../../core/widgets/showdialog_errors.dart';
import '../../../../../core/widgets/showdialog_loadin.dart';
import '../../logic/cubit/otp_cubit.dart';


class ResetSentOtpBlocListener extends StatelessWidget {
  const ResetSentOtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          current is ResendOtpLoading || current is ResendOtpSuccess || current is ResendOtpError,
      listener: (context, state) {
        state.whenOrNull(
          resendOtpLoading: () {
            showDialogLoading(context);
          },
          resendOtpSuccess: (restSendResponse) {
            context.pop(); 
          },
          resendOtpError: (apiErrorModel) {
            context.pop();
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
