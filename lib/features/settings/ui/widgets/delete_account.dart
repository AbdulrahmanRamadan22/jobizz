import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/cache/constants.dart';
import 'package:jobizz/core/cache/shared_pref.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/routing/routers_string.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/core/widgets/showdialog_loadin.dart';
import 'package:jobizz/features/auth/delet_account/logic/cubit/delete_acount_cubit.dart';
import 'package:jobizz/features/auth/delet_account/logic/cubit/delete_acount_state.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        state.whenOrNull(
          deleteAccountLoading: () {
            showDialogLoading(context);
          },
          deleteAccountSuccess: (data) {
            Navigator.pop(context); // Close loader
            SharedPrefHelper.removeData(key: SharedPrefKeys.token);
            SharedPrefHelper.removeData(key: SharedPrefKeys.email);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account deleted successfully')),
            );
            context.pushNamedAndRemoveUntil(
              Routes.loginScreen,
              predicate: (_) => false,
            );
          },
          deleteAccountFailure: (error) {
            Navigator.pop(context); // Close loader
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.message ?? 'Delete failed')),
            );
          },
        );
      },
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(
            Icons.delete_outlined,
            color: ColorsApp.red,
            size: 30.0,
          ),
          title: Text(
            'Delete Account',
            style: TextStyles.font16Red,
          ),
          onTap: () {
            final savedEmail =
                SharedPrefHelper.getData(key: SharedPrefKeys.email) ?? '';

            final TextEditingController confirmController =
                TextEditingController();

            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Delete Account"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want to delete your account?",
                      style: TextStyles.font16Gray,
                    ),
                    const SizedBox(height: 16),
                    SelectableText(
                      savedEmail,
                      style: TextStyles.font166MainBlueMedium,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: confirmController,
                      decoration: InputDecoration(
                        labelText: 'Enter email you wish to delete',
                        labelStyle: TextStyles.font14Gray,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () async {
                      final typedEmail = confirmController.text.trim();
                      if (typedEmail != savedEmail) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: ColorsApp.lightRed,
                            content: Text(
                              'Please enter the email you want to delete in the form field.',
                              style: TextStyles.font16Red,
                            ),
                          ),
                        );
                        return;
                      }

                      Navigator.pop(context); // Close dialog
                      final token = await SharedPrefHelper.getSecuredString(
                          key: SharedPrefKeys.token);
                      if (token != null && token.isNotEmpty) {
                        context.read<DeleteAccountCubit>().deleteAccount(token);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Token not found'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
      



      //ToDo UI first 
//       class DeleteAccount extends StatelessWidget {
//   const DeleteAccount({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
//       listener: (context, state) {
//         state.whenOrNull(
//           deleteAccountLoading: () {
//             showDialogLoading(context);
//           },
//           deleteAccountSuccess: (data) {
//             Navigator.pop(context); // Close loader
//             SharedPrefHelper.removeData(
//               key: SharedPrefKeys.token,
//             );
//             // SharedPrefHelper.removeData(
//             //   key: SharedPrefKeys.email,
//             // );
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Account deleted successfully'),
//               ),
//             );
//             context.pushNamedAndRemoveUntil(Routes.loginScreen,
//                 predicate: (_) => false);
//           },
//           deleteAccountFailure: (error) {
//             Navigator.pop(context); // Close loader
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(error.message ?? 'Delete failed'),
//               ),
//             );
//           },
//         );
//       },
//       builder: (context, state) {
//         return ListTile(
//           contentPadding: EdgeInsets.zero,
//           leading: const Icon(
//             Icons.delete_outlined,
//             color: ColorsApp.red,
//             size: 30.0,
//           ),
//           title: Text(
//             'Delete Account',
//             style: TextStyles.font16Red,
//           ),
//           onTap: () {
//             final email = SharedPrefHelper.getData(key: SharedPrefKeys.email) ??
//                 'your account';
//             showDialog(
//               context: context,
//               builder: (_) => AlertDialog(
//                 title: const Text("Delete Account"),
//                 content: Text.rich(
//                   TextSpan(
//                     text: "Are you sure you want to delete your account ",
//                     style: TextStyles.font14Gray,
//                     children: [
//                       TextSpan(
//                         text: email,
//                         style: TextStyles.font16Black,
//                       ),
//                       const TextSpan(text: " ? This action cannot be undone."),
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text("Cancel"),
//                   ),
//                   TextButton(
//                     onPressed: () async {
//                       Navigator.pop(context); // Close dialog

//                       final token = await SharedPrefHelper.getSecuredString(
//                           key: SharedPrefKeys.token);

//                       if (token != null && token.isNotEmpty) {
//                         context.read<DeleteAccountCubit>().deleteAccount(token);
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Token not found'),
//                           ),
//                         );
//                       }
//                     },
//                     child: const Text(
//                       "Delete",
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// } 