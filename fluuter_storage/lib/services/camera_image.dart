import 'package:image_picker/image_picker.dart';

Future<XFile?> getPhoto() async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  return photo;
}
