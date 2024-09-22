// import 'package:flutter/material.dart';

import '../core/connection/service/rest_service.dart';
import '../core/init/constants/app/api_endpoints.dart';
import '../core/model/config_version/config_version_data_model.dart';
import '../core/model/config_version/config_version_model.dart';
import '../core/model/upload_multiple_files/file_path_model.dart';
import '../core/model/upload_multiple_files/file_with_path_model.dart';
import '../core/model/upload_multiple_files/files_with_paths_list_model.dart';
import '../core/model/upload_multiple_files/upload_file_data_list_model.dart';
import '../core/model/upload_multiple_files/upload_file_data_model.dart';
import '../core/model/upload_multiple_files/upload_file_model.dart';
// import '../core/model/userprofile/user_profile_data_model.dart';

class GlobalRepo {
  // Future<SalesPlannerTypeDataList>
  //     getSalesPlannerTypeDataListActiveFlag() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       noBody: true,
  //       urlPath: ApiEndpoint.salesPlannerTypeActiveFlag,
  //     );
  //     return SalesPlannerTypeDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<CustomerGradeDataList> getCustomerGradeDataListActiveFlag() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       noBody: true,
  //       urlPath: ApiEndpoint.customerGradeActiveFlag,
  //     );
  //     return CustomerGradeDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<CustomerTypeDataList> getCustomerTypeDataListActiveFlag() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       noBody: true,
  //       urlPath: ApiEndpoint.customerTypeActiveFlag,
  //     );
  //     return CustomerTypeDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<CustomerDataList> getCustomerDataListDropdown() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       noBody: true,
  //       urlPath: ApiEndpoint.customerDropDown,
  //     );
  //     return CustomerDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<RoleData> getUserByRoleDataList({
  //   required int roleId,
  // }) async {
  //   try {
  //     final response = await RestService.getWithAuthAPI(
  //       urlPath: '${ApiEndpoint.usersByRole}/$roleId',
  //     );
  //     return RoleData.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ProjectGroupDataList> getProjectGroupDataList() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "name": 'โครงการเก่า'},
  //         {"id": 2, "name": 'โครงการใหม่'},
  //       ]
  //     };
  //     return ProjectGroupDataList.fromJson(mapData);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<AgencyDataList> getAgencyTypesList() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.agencyTypes,
  //       noBody: true,
  //     );
  //     return AgencyDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ProjectTypesDataList> getProjectTypesList() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.projectTypes,
  //       noBody: true,
  //     );
  //     return ProjectTypesDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ProjectSheetDataList> getProjectSheetList() async {
  //   try {
  //     final response = await RestService.getWithAuthAPI(
  //       urlPath: ApiEndpoint.projectSheet,
  //     );
  //     return ProjectSheetDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<BuildingTypesDataList> getBuildingTypesList() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.buildingTypes,
  //       noBody: true,
  //     );
  //     return BuildingTypesDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ProjectStatusDataList> getProjectStatusList() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.projectStatus,
  //       noBody: true,
  //     );
  //     return ProjectStatusDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<TypesOfSurveyedDataList> getTypesOfSurveyedDataList() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.typeOfSurvey,
  //       noBody: true,
  //     );
  //     return TypesOfSurveyedDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ProjectGradeSpecDataList> getProjectGradeSpecList() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.projectGradeSpec,
  //       noBody: true,
  //     );
  //     return ProjectGradeSpecDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ProjectSheetDataList> getProjectSheetDropdown() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.projectSheetDropdwon,
  //       noBody: true,
  //     );
  //     return ProjectSheetDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ProjectSheetData> getProjectSheetData({
  //   required int? id,
  // }) async {
  //   try {
  //     final response = await RestService.getWithAuthAPI(
  //       urlPath: '${ApiEndpoint.projectSheet}/$id',
  //     );
  //     return ProjectSheetData.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ProductDataList> getProductDataListDropdown() async {
  //   try {
  //     final response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.productDropdown,
  //       noBody: true,
  //     );
  //     return ProductDataList.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ProjectSheetDataList> getProjectSheetFindToDropdown() async {
  //   try {
  //     var response = await RestService.postWithAuthAPI(
  //       urlPath: '${ApiEndpoint.projectSheet}${ApiEndpoint.findToDropdown}',
  //       noBody: true,
  //     );
  //     final jsonData = ProjectSheetDataList.fromJson(response);
  //     return jsonData;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     rethrow;
  //   }
  // }

  // //sendEmailOtp
  // Future<EmailOtp?> postSendEmailOTP({required Map bodyData}) async {
  //   try {
  //     var response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.sendEmailOtp,
  //       bodyData: bodyData,
  //     );
  //     return EmailOtpData.fromJson(response).data;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // //sendEmailOtp
  // Future<EmailOtp?> postVerifyEmailOTP({required Map bodyData}) async {
  //   try {
  //     var response = await RestService.postWithAuthAPI(
  //       urlPath: ApiEndpoint.verifyEmailOtp,
  //       bodyData: bodyData,
  //     );
  //     return EmailOtpData.fromJson(response).data;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // //get Configs
  // Future<ConfigVersion?> getConfigVersionByKey({
  //   required String key,
  // }) async {
  //   try {
  //     var response = await RestService.getWithAuthAPI(
  //         urlPath: '${ApiEndpoint.configs}/$key');
  //     return ConfigVersionData.fromJson(response).data;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> setExpiresAt() async {
  //   await Singleton.shared.setExpiresAt(
  //     (DateTime.now().add(const Duration(minutes: 15))).toString(),
  //   );
  // }

  // static Future<MaterialsDataList> getMaterialList() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "name": 'A', "deviceType": "พลาสติก"},
  //         {"id": 2, "name": 'B', "deviceType": "แก้ว"},
  //         {"id": 4, "name": 'C', "deviceType": "กระเบื้อง"},
  //         {"id": 5, "name": 'D', "deviceType": "อะลูมิเนียม"},
  //         {"id": 6, "name": 'E', "deviceType": "พลาสติก"},
  //         {"id": 7, "name": 'F', "deviceType": "แก้ว"},
  //         {"id": 8, "name": 'G', "deviceType": "กระเบื้อง"},
  //         {"id": 9, "name": 'H', "deviceType": "อะลูมิเนียม"}
  //       ]
  //     };
  //     // final response = await RestService.getWithAuthAPI(urlPath: '/banners');
  //     final jsonData = MaterialsDataList.fromJson(mapData);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<UnitDataList> getUnitList() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "name": 'ตารางเมตร'},
  //         {"id": 2, "name": 'เมตร'},
  //         {"id": 3, "name": 'จุด'},
  //         {"id": 4, "name": 'งานเหมา'},
  //         {"id": 5, "name": 'แผ่น'},
  //         {"id": 6, "name": 'ชิ้น'},
  //         {"id": 7, "name": 'ม้วน'},
  //         {"id": 8, "name": 'ถัง'},
  //         {"id": 9, "name": 'ชุด/SET'},
  //         {"id": 10, "name": 'JOB'},
  //       ]
  //     };
  //     // final response = await RestService.getWithAuthAPI(urlPath: '/banners');
  //     final jsonData = UnitDataList.fromJson(mapData);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<CustomerGradeDataList> getCustomerGradeList() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "name": 'A'},
  //         {"id": 2, "name": 'B'},
  //         {"id": 3, "name": 'C'}
  //       ]
  //     };
  //     // final response = await RestService.getWithAuthAPI(urlPath: '/banners');
  //     final jsonData = CustomerGradeDataList.fromJson(mapData);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<CarDataList> getCarLicensePlateList() async {
  //   try {
  //     // Map<String, dynamic> mapData = {
  //     //   "data": [
  //     //     {"id": 1, "name": 'กขค123'},
  //     //     {"id": 2, "name": 'คง123'},
  //     //     {"id": 3, "name": 'พธน1234'}
  //     //   ]
  //     // };
  //     final response =
  //         await RestService.getWithAuthAPI(urlPath: ApiEndpoint.cars);
  //     final jsonData = CarDataList.fromJson(response);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<EmployeeModel> getEmployeeList() async {
  //   try {
  //     // Map<String, dynamic> mapData = {
  //     //   "data": [
  //     //     {
  //     //       "id": 1,
  //     //       "name": 'นายพล',
  //     //       "key": GlobalKey<DropdownSearchState<EmployeeData>>
  //     //     },
  //     //     {
  //     //       "id": 2,
  //     //       "name": 'นายอาร์ม',
  //     //       "key": GlobalKey<DropdownSearchState<EmployeeData>>
  //     //     },
  //     //     {
  //     //       "id": 3,
  //     //       "name": 'นายเอก',
  //     //       "key": GlobalKey<DropdownSearchState<EmployeeData>>
  //     //     }
  //     //   ]
  //     // };
  //     final response = await RestService.getWithAuthAPI(urlPath: '/users');
  //     final jsonData = EmployeeModel.fromJson(response);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<DriverDataList> getDriverList() async {
  //   try {
  //     // Map<String, dynamic> mapData = {
  //     //   "data": [
  //     //     {"id": 1, "name": 'นายเอ'},
  //     //     {"id": 2, "name": 'นางบี'},
  //     //     {"id": 3, "name": 'คุณซี'}
  //     //   ]
  //     // };
  //     final response = await RestService.getWithAuthAPI(urlPath: '/users');
  //     final jsonData = DriverDataList.fromJson(response);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<CustomerTypeDataList> getCustomerGroupTypesList() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "name": 'A'},
  //         {"id": 2, "name": 'B'},
  //         {"id": 3, "name": 'C'}
  //       ]
  //     };
  //     // final response = await RestService.getWithAuthAPI(urlPath: '/banners');
  //     final jsonData = CustomerTypeDataList.fromJson(mapData);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<CustomerTypeDataList> getCustomerTypesList() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "name": 'เจ้าของโครงการ'},
  //         {"id": 2, "name": 'สถาปนิกโครงการ'},
  //         {"id": 3, "name": 'ภูมิสถาปนิกโครงการ'},
  //         {"id": 4, "name": 'ที่ปรึกษาโครงการ'},
  //         {"id": 5, "name": 'ผู้รับเหมาหลัก'},
  //         {"id": 6, "name": 'ผู้รับเหมาช่วง'},
  //         {"id": 7, "name": 'ผู้ออกแบบและผู้รับเหมา'},
  //       ]
  //     };
  //     // final response = await RestService.getWithAuthAPI(urlPath: '/banners');
  //     final jsonData = CustomerTypeDataList.fromJson(mapData);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<CustomerDataList> getCustomerName() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "name": 'นายเอ', "companyName": "A company"},
  //         {"id": 2, "name": 'นายบี', "companyName": "B company"},
  //         {"id": 3, "name": 'นายอาร์ม', "companyName": "Amarin"},
  //         {"id": 4, "name": 'นางว่าน', "companyName": "123record"},
  //         {"id": 5, "name": 'นายเบิร์ด', "companyName": "grammy"},
  //       ]
  //     };
  //     // final response = await RestService.getWithAuthAPI(urlPath: '/banners');
  //     final jsonData = CustomerDataList.fromJson(mapData);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<UserProfileDataList> getSaleProjectList() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "full_name": 'น้ำตาล'},
  //         {"id": 2, "full_name": 'ปาล์ม'},
  //       ]
  //     };
  //     // final response = await RestService.getWithAuthAPI(urlPath: '/banners');
  //     final jsonData = UserProfileDataList.fromJson(mapData);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<UserProfileDataList> getSpecProjectList() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "full_name": 'แตงโม'},
  //         {"id": 2, "full_name": 'มิยูกิ'},
  //         {"id": 3, "full_name": 'วิว'},
  //       ]
  //     };
  //     // final response = await RestService.getWithAuthAPI(urlPath: '/banners');
  //     final jsonData = UserProfileDataList.fromJson(mapData);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<UserProfileDataList> getInstallProjectList() async {
  //   try {
  //     Map<String, dynamic> mapData = {
  //       "data": [
  //         {"id": 1, "full_name": 'กี้'},
  //         {"id": 2, "full_name": 'ปิ๊ง'},
  //         {"id": 3, "full_name": 'เฟริส'},
  //         {"id": 4, "full_name": 'เก้า'},
  //         {"id": 5, "full_name": 'รีม'},
  //         {"id": 6, "full_name": 'นัท'},
  //         {"id": 7, "full_name": 'บอม'},
  //       ]
  //     };
  //     // final response = await RestService.getWithAuthAPI(urlPath: '/banners');
  //     final jsonData = UserProfileDataList.fromJson(mapData);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // // Future<bool> postUploadMuiltipleFile({
  // //   required String folderName,
  // //   required List<FilesWithPathsModel> fileslist,
  // // }) async {
  // //   try {
  // //     for (var item in fileslist) {
  // //       if (item.linkList == null && item.filesPath != null) {
  // //         final response = await RestService.postUploadMultipleFileWithAuthAPI(
  // //           folderName: folderName,
  // //           filename: item.mainPath,
  // //           filePath: item.filesPath!,
  // //         );
  // //         List<UploadMultipleFiles>? data =
  // //             UploadMultipleFilesDataList.fromJson(response).data;
  // //         String? link = data?.first.path;
  // //         if (link != null) {
  // //           item.linkList = link;
  // //           item.filesPath = null;
  // //         }
  // //       }
  // //     }
  // //     return fileslist.every((item) => item.filesPath == null);
  // //   } catch (e) {
  // //     rethrow;
  // //   }
  // // }

  // // Future<bool> postUploadMuiltipleFile({
  // //   required List<FilesWithPathsListModel> filesWithPathsList,
  // // }) async {
  // //   try {
  // //     for (var filesWithPaths in filesWithPathsList) {
  // //       if (!filesWithPaths.upLoadedSuccess) {
  // //         final response = await RestService.postUploadMultipleFileWithAuthAPI(
  // //           bodyData: filesWithPaths,
  // //         );
  // //         List<UploadFile>? files =
  // //             UploadFileDataList.fromJson(response).data ?? [];
  // //         if (files.isNotEmpty) {
  // //           for (var i = 0; i < files.length; i++) {
  // //             final file = files[i];
  // //             String extractedPart = '';
  // //             extractedPart = file.filename!.substring(
  // //               16,
  // //               file.filename!.lastIndexOf('.'),
  // //             );
  // //             if (file.mainPath == filesWithPaths.mainPath) {
  // //               if (filesWithPaths.filePathList.isNotEmpty) {
  // //                 for (var i = 0; i < filesWithPaths.filePathList.length; i++) {
  // //                   final path = filesWithPaths.filePathList[i];
  // //                   if (path.filename == extractedPart) {
  // //                     path.linkURL = true;
  // //                     bool pathFound = false;
  // //                     for (var i = 0;
  // //                         i < filesWithPaths.fileLinkList.length;
  // //                         i++) {
  // //                       FilePathModel pathLink = filesWithPaths.fileLinkList[i];
  // //                       if (pathLink.filename == extractedPart) {
  // //                         pathFound = true;
  // //                         filesWithPaths.fileLinkList[i] = FilePathModel(
  // //                           filename: extractedPart,
  // //                           filePath: file.path ?? '',
  // //                           linkURL: true,
  // //                         );
  // //                         break;
  // //                       }
  // //                     }
  // //                     if (!pathFound) {
  // //                       List<FilePathModel> linkList = [];
  // //                       linkList.addAll(filesWithPaths.fileLinkList);
  // //                       linkList.add(
  // //                         FilePathModel(
  // //                           filename: extractedPart,
  // //                           filePath: file.path ?? '',
  // //                           linkURL: true,
  // //                         ),
  // //                       );
  // //                       filesWithPaths.fileLinkList = linkList;
  // //                     }
  // //                   }
  // //                 }
  // //               }
  // //             }
  // //           }
  // //           filesWithPaths.upLoadedSuccess = true;
  // //         }
  // //       }
  // //     }
  // //     return filesWithPathsList.every((item) => item.upLoadedSuccess);
  // //   } catch (e) {
  // //     rethrow;
  // //   }
  // // }
  Future<ConfigVersion?> getConfigVersionByKey({
    required String key,
  }) async {
    try {
      var response = await RestService.getWithAuthAPI(
          urlPath: '${ApiEndpoint.configs}/$key');
      return ConfigVersionData.fromJson(response).data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FilePathModel>> postUploadMuiltipleFiles({
    required FilesWithPathsListModel bodyData,
  }) async {
    try {
      final response = await RestService.postUploadMultipleFileWithAuthAPI(
        bodyData: bodyData,
      );
      List<UploadFile> files = UploadFileDataList.fromJson(response).data ?? [];
      if (files.isEmpty) return [];
      return files.map(
        (item) {
          String extractedPart = '';
          extractedPart = (item.filename ?? '').substring(
            16,
            (item.filename ?? '').lastIndexOf('.'),
          );
          return FilePathModel(
            filename: extractedPart,
            fileNetwork: item.path,
            linkURL: true,
          );
        },
      ).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<FilePathModel> postUploadSingleFile({
    required FileWithPathModel bodyData,
  }) async {
    try {
      final response = await RestService.postUploadSingleFileWithAuthAPI(
        bodyData: bodyData,
      );
      UploadFile? file = UploadFileData.fromJson(response).data;

      String extractedPart = '';
      extractedPart = (file?.filename ?? '').substring(
        16,
        (file?.filename ?? '').lastIndexOf('.'),
      );
      return FilePathModel(
        filename: extractedPart,
        fileNetwork: file?.path,
        linkURL: true,
      );
    } catch (e) {
      rethrow;
    }
  }
}
