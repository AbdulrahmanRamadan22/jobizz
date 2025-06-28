import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/saved_jobs/cubit/saved_cubit.dart';
import 'package:jobizz/features/saved_jobs/cubit/saved_state.dart';
import 'package:jobizz/features/saved_jobs/ui/widgets/list_view_builder_card.dart';

class SavedJobsBlocBuilder extends StatelessWidget {
  const SavedJobsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      buildWhen: (previous, current) =>
          current is SavedSuccess ||
          current is SavedLoading ||
          current is SavedError,
      builder: (context, state) {
        return state.maybeWhen(
          savedSuccess: (response) {
            final savedJobs = response.data?.favoriteJobs;

            return ListViewBuilderCard(
              savedJobs: savedJobs,
            );
          },
          savedLoading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          savedFailure: (error) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                'Not Found Saved Jobs',
                style: TextStyles.font14Gray,
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
