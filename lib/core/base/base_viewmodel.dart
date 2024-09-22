import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../utility/app_snack_bar.dart';

class BaseViewModel extends ChangeNotifier {
  bool _loadingMain = false;
  bool get loadingMain => _loadingMain;
  set loadingMain(bool value) {
    _loadingMain = value;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _loadingPage = false;
  bool get loadingPage => _loadingPage;
  set loadingPage(bool value) {
    _loadingPage = value;
    notifyListeners();
  }

  bool _loadingSearch = false;
  bool get loadingSearch => _loadingSearch;
  set loadingSearch(bool value) {
    _loadingSearch = value;
    notifyListeners();
  }

  String? _msgError;
  String? get msgError => _msgError;
  set msgError(String? value) {
    _msgError = value;
    notifyListeners();
  }

  int _itemsPerPage = 12;
  int get itemsPerPage => _itemsPerPage;
  set itemsPerPage(int value) {
    _itemsPerPage = value;
    notifyListeners();
  }

  int _page = 1;
  int get page => _page;
  set page(int value) {
    _page = value;
    notifyListeners();
  }

  int _currentPage = 1;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  int _totalPages = 0;
  int get totalPages => _totalPages;
  set totalPages(int value) {
    _totalPages = value;
    notifyListeners();
  }

  int _totalItems = 0;
  int get totalItems => _totalItems;
  set totalItems(int value) {
    _totalItems = value;
    notifyListeners();
  }

  bool _hasMoreProduct = false;
  bool get hasMoreProduct => _hasMoreProduct;
  set hasMoreProduct(bool value) {
    _hasMoreProduct = value;
    notifyListeners();
  }

  String? _isUpdateStatus;
  String? get isUpdateStatus => _isUpdateStatus;
  set isUpdateStatus(String? value) {
    _isUpdateStatus = value;
    notifyListeners();
  }

  void unfocus(BuildContext context) =>
      FocusManager.instance.primaryFocus?.unfocus();

  Future getArguments(BuildContext context) async =>
      ModalRoute.of(context)?.settings.arguments;

  Future<String?> getFilePath(
    BuildContext context, {
    required ImageSource source,
    CameraDevice? preferredCameraDevice,
  }) async {
    try {
      final ImagePicker picker = ImagePicker();
      final pickedFile = await picker
          .pickImage(
        source: source,
        preferredCameraDevice: preferredCameraDevice ?? CameraDevice.rear,
        imageQuality: 60,
      )
          .onError((error, stackTrace) {
        return null;
      });
      return pickedFile?.path;
    } catch (e) {
      return null;
    }
  }

  //ตัวอย่างการ uploadFileMultiple
  /* List<FilePathModel> _imageCheckInList = [];
  List<FilePathModel> get imageCheckInList => _imageCheckInList;

  Future<bool?> getFileImageInit(
    BuildContext context, {
    required String mainPath,
    required String folderName,
    required String filename,
  }) async {
    await getFilePath(
      context,
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    ).then((path) {
      if (path == null) {
        AppNav.close(context);
        return null;
      } else {
        imagePath = path;
        int count = _imageCheckInList.length + 1;
        while (true) {
          final newFilename = "$filename-$count";
          bool filenameExists = _imageCheckInList
              .any((element) => element.filename == newFilename);
          if (!filenameExists) {
            _imageCheckInList.add(
              FilePathModel(
                filename: newFilename,
                filePath: path,
              ),
            );
            break;
          }
          count++;
        }
      }
    });
    return true;
  }

  Future<List<FilePathModel>> postUploadMuiltipleFiles(
    BuildContext context, {
    required FilesWithPathsListModel bodyData,
  }) async {
    try {
      return await _globalRepo.postUploadMuiltipleFiles(
        bodyData: bodyData,
      );
    } catch (e) {
      rethrow;
    }
  } */

  DateTime timeBackPressed = DateTime.now();

  Future isExitWarning(BuildContext context) async {
    final difference = DateTime.now().difference(timeBackPressed);
    final isExitWarning = difference >= const Duration(seconds: 2);
    timeBackPressed = DateTime.now();
    if (isExitWarning) {
      AppSnackBar.error(
        context,
        text: 'กด BACK อีกครั้ง เพื่อออกจากแอป',
        seconds: 2,
      );
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      SystemNavigator.pop();
    }
  }
}
