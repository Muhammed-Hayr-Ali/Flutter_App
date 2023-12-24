import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class ImageService {
  final _picker = ImagePicker();

  Future<ImageSource?> selectImageSource() async {
    ImageSource? imageSource;

    await custombottomSheet(
        title: 'Select Image',
        child: Column(
          children: [
            CustomListItem(
              child: SizedBox(
                  height: 48,
                  width: 48,
                  child: SvgPicture.asset(AppAssets.camera)),
              onTap: () => Get.back(result: ImageSource.camera),
            ),
            const Divider(),
            CustomListItem(
              child: SizedBox(
                  height: 48,
                  width: 48,
                  child: SvgPicture.asset(AppAssets.gallery)),
              onTap: () => Get.back(result: ImageSource.gallery),
            ),
          ],
        )).then((value) {
      imageSource = value;
    });
    return imageSource;
  }

  Future<String?> getImage() async {
    final bool accessCamera = await PerHandler.camera();
    final bool accessStorage = await PerHandler.storage();

    if (!accessCamera || !accessStorage) return null;

    final response = await selectImageSource();
    if (response == null) {
      return null;
    }

    final pickedFile = await _picker.pickImage(source: response);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    return null;
  }
}
