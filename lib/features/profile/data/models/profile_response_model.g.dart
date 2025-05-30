// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseModel _$ProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      profileData: json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.profileData,
    };

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      titleJob: json['title_job'] as String,
      jobPosition: json['job_position'] as String,
      isDefault: (json['is_default'] as num).toInt(),
      profileImage: json['profile_image'] as String,
      appliedApplications: (json['applied_applications'] as num).toInt(),
      interviewApplications: (json['interview_applications'] as num).toInt(),
      reviewedApplications: (json['reviewed_applications'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      educations: (json['educations'] as List<dynamic>)
          .map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      experiences: (json['experiences'] as List<dynamic>)
          .map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      cvs: (json['cvs'] as List<dynamic>)
          .map((e) => Cv.fromJson(e as Map<String, dynamic>))
          .toList(),
      portfolios: (json['portfolios'] as List<dynamic>)
          .map((e) => Portfolios.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title_job': instance.titleJob,
      'job_position': instance.jobPosition,
      'is_default': instance.isDefault,
      'profile_image': instance.profileImage,
      'applied_applications': instance.appliedApplications,
      'interview_applications': instance.interviewApplications,
      'reviewed_applications': instance.reviewedApplications,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'educations': instance.educations,
      'experiences': instance.experiences,
      'cvs': instance.cvs,
      'portfolios': instance.portfolios,
    };

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      id: (json['id'] as num).toInt(),
      college: json['college'] as String,
      degree: json['degree'] as String,
      fieldOfStudy: json['field_of_study'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      isCurrent: json['is_current'] as bool,
      description: json['description'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'id': instance.id,
      'college': instance.college,
      'degree': instance.degree,
      'field_of_study': instance.fieldOfStudy,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_current': instance.isCurrent,
      'description': instance.description,
      'location': instance.location,
      'image': instance.image,
    };

Experience _$ExperienceFromJson(Map<String, dynamic> json) => Experience(
      id: (json['id'] as num).toInt(),
      company: json['company'] as String,
      position: json['position'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      isCurrent: json['is_current'] as bool,
      description: json['description'] as String,
      location: json['location'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ExperienceToJson(Experience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'position': instance.position,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_current': instance.isCurrent,
      'description': instance.description,
      'location': instance.location,
      'image': instance.image,
    };

Cv _$CvFromJson(Map<String, dynamic> json) => Cv(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$CvToJson(Cv instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'path': instance.path,
    };

Portfolios _$PortfoliosFromJson(Map<String, dynamic> json) => Portfolios(
      pdf: (json['pdf'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Pdf.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: (json['url'] as List<dynamic>?)
          ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => PortfolioImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PortfoliosToJson(Portfolios instance) =>
    <String, dynamic>{
      'pdf': instance.pdf,
      'url': instance.url,
      'images': instance.images,
    };

Pdf _$PdfFromJson(Map<String, dynamic> json) => Pdf(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      format: json['format'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$PdfToJson(Pdf instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'format': instance.format,
      'path': instance.path,
    };

Url _$UrlFromJson(Map<String, dynamic> json) => Url(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      format: json['format'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UrlToJson(Url instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'format': instance.format,
      'url': instance.url,
    };

PortfolioImages _$PortfolioImagesFromJson(Map<String, dynamic> json) =>
    PortfolioImages(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      format: json['format'] as String?,
      imageCount: (json['image_count'] as num?)?.toInt(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => PortfolioImageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PortfolioImagesToJson(PortfolioImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'format': instance.format,
      'image_count': instance.imageCount,
      'images': instance.images,
    };

PortfolioImageItem _$PortfolioImageItemFromJson(Map<String, dynamic> json) =>
    PortfolioImageItem(
      id: (json['id'] as num?)?.toInt(),
      path: json['path'] as String?,
    );

Map<String, dynamic> _$PortfolioImageItemToJson(PortfolioImageItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
    };
