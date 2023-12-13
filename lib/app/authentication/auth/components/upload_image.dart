import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class UploadImage extends StatefulWidget {
  final TextEditingController pathImage;
  final double size;
  const UploadImage({super.key, required this.pathImage, this.size = 128});
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  ImageService imageService = ImageService();

  String? path;

  void uploadingImage() async {
    final imagePath = await imageService.getImage();
    if (imagePath != null) {
      setState(() {
        path = imagePath;
      });
      widget.pathImage.text = imagePath;
    }
  }

  void removeImage() {
    setState(() {
      path = null;
    });
    widget.pathImage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: uploadingImage,
          onLongPress: removeImage,
          child: CustomAvatar(
            imageUrl: path ?? '',
            sourceImage: SourceImage.localImage,
          )),
    );
  }
}
