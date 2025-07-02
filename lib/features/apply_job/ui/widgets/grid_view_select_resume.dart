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
      buildWhen: (previous, current) =>
          current is GetAllResumesLoading ||
          current is GetAllResumesSuccess ||
          current is GetAllResumesFailure,
      builder: (context, state) {
        return state.whenOrNull(
              getAllResumesLoading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              getAllResumesSuccess: (resumes) {
                if (resumes.isEmpty) {
                  return const Center(
                    child: Text('No resumes found'),
                  );
                }
                
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    mainAxisExtent: 100.h, // Increased height for better layout
                  ),
                  itemCount: resumes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final isSelected = selectedIndex == index;
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = isSelected ? null : index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: ColorsApp.whiteColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: isSelected 
                                ? ColorsApp.mainBlue 
                                : Colors.transparent,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Row(
                            children: [
                              Icon(
                                isSelected 
                                    ? Icons.check_circle 
                                    : Icons.radio_button_unchecked,
                                size: 24.r,
                                color: isSelected
                                    ? ColorsApp.mainBlue
                                    : ColorsApp.lightBlueGray,
                              ),
                              horizontalSpace(12),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, 
                                        vertical: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorsApp.darkBlue,
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                      child: Text(
                                        resumes[index].name ?? 'Resume Name',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyles.font8White,
                                      ),
                                    ),
                                    verticalSpace(8),
                                    Text(
                                      SharedPrefHelper.getData(
                                        key: SharedPrefKeys.fullName,
                                      )?.toString() ?? 'Unknown User',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.font11Black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              getAllResumesFailure: (error) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48.r,
                      color: Colors.red,
                    ),
                    verticalSpace(16),
                    Text(
                      'Failed to load resumes',
                      style: TextStyles.font11Black,
                    ),
                    verticalSpace(8),
                    Text(
                      error.toString(),
                      style: TextStyles.font8White.copyWith(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ) ??
            const Center(child: CircularProgressIndicator());
      },
    );
  }
}