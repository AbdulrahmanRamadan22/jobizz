import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../profile/logic/resume/resume_cubit.dart';
import '../../../profile/logic/resume/resume_state.dart';

class GridViewSelectResume extends StatefulWidget {
  const GridViewSelectResume({super.key});

  @override
  State<GridViewSelectResume> createState() => _GridViewSelectResumeState();
}

class _GridViewSelectResumeState extends State<GridViewSelectResume> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      // bloc: BlocProvider.of<ResumeCubit>(context)..getAllResume(),
      buildWhen: (previous, current) =>
          current is GetAllResumesLoading ||
          current is GetAllResumesSuccess ||
          current is GetAllResumesFailure,
      builder: (context, state) {
        return state.whenOrNull(
              // getAllResumesLoading: () => const Center(child: CircularProgressIndicator()),
              getAllResumesSuccess: (resumes) => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 80, //
                ),
                itemCount: resumes.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = (selectedIndex == index) ? null : index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsApp.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex =
                                    (selectedIndex == index) ? null : index;
                              });
                            },
                            icon: Icon(
                              Icons.check_circle,
                              size: 28.r,
                              color: selectedIndex == index
                                  ? ColorsApp.mainBlue
                                  : ColorsApp.lightBlueGray,
                            ),
                          ),
                          horizontalSpace(15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: ColorsApp.darkBlue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  resumes[index].name ?? 'Resume Name',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.font8White,
                                ),
                              ),
                              verticalSpace(5),
                              Text(
                                "${SharedPrefHelper.getData(key: SharedPrefKeys.fullName)}",
                                style: TextStyles.font11Black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              getAllResumesFailure: (error) =>
                  Center(child: Text('Error: $error')),
            ) ??
            const Center(child: CircularProgressIndicator());
      },
    );
  }
}
// 55