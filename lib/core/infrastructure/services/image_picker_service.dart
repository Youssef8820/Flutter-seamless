import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {

  Future<XFile?> pickImageFromGallery();

  Future<XFile?> pickImageFromCamera();

}


class ImagePickerServiceImpl implements ImagePickerService {

  final ImagePicker picker = ImagePicker();

  @override
  Future<XFile?> pickImageFromCamera() async {
    return await picker.pickImage(source: ImageSource.camera);
  }

  @override
  Future<XFile?> pickImageFromGallery() async {
    return await picker.pickImage(source: ImageSource.gallery);
  }

}