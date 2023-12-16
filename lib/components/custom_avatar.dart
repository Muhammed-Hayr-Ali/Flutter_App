import 'package:application/packages.dart';
import 'package:application/required_files.dart';

enum SourceImage { networkImage, localImage }

class CustomAvatar extends StatelessWidget {
  final SourceImage sourceImage;
  final String? imagePath;
  final double size;
  final Color backgroundColor;
  final double borderWidth;
  const CustomAvatar({
    super.key,
    this.imagePath,
    this.size = 128.0,
    this.backgroundColor = const Color(0xFFF6F6F6),
    this.borderWidth = 0,
    required this.sourceImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size), color: backgroundColor),
      height: size,
      width: size,
      padding: EdgeInsets.all(borderWidth),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: imagePath == '' || imagePath == null
            ? DecoratedBox(
                decoration: BoxDecoration(color: backgroundColor),
                child: Padding(
                  padding: EdgeInsets.all(size * 0.2),
                  child: SvgPicture.asset(
                    AppAssets.user,
                  ),
                ),
              )
            : sourceImage == SourceImage.localImage
                ? Image.file(
                    fit: BoxFit.cover,
                    File(imagePath!),
                  )
                : CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imagePath!,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: const Color.fromRGBO(245, 245, 245, 1),
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                    errorWidget: (context, url, error) => DecoratedBox(
                      decoration: BoxDecoration(color: backgroundColor),
                      child: Padding(
                        padding: EdgeInsets.all(size * 0.2),
                        child: SvgPicture.asset(
                          AppAssets.user,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
    //     child: imagePath == null ?
        
    //     DecoratedBox(
    //                 decoration: BoxDecoration(color: backgroundColor),
    //                 child: Padding(
    //                   padding: EdgeInsets.all(size * 0.2),
    //                   child: SvgPicture.asset(
    //                     AppAssets.user,
    //                   ),
    //                 ),
    //               )
        
        
    //     :
        
    //      sourceImage == SourceImage.localImage
    //         ? imagePath != ''
    //             ? Image.file(
    //                 fit: BoxFit.cover,
    //                 File(imagePath!),
    //               )
    //             : CachedNetworkImage(
    //             fit: BoxFit.cover,
    //             imageUrl: imagePath!,
    //             placeholder: (context, url) => Shimmer.fromColors(
    //               baseColor: const Color.fromRGBO(245, 245, 245, 1),
    //               highlightColor: Colors.grey.shade100,
    //               enabled: true,
    //               child: Container(
    //                 color: Colors.black,
    //               ),
    //             ),
    //             errorWidget: (context, url, error) => DecoratedBox(
    //               decoration: BoxDecoration(color: backgroundColor),
    //               child: Padding(
    //                 padding: EdgeInsets.all(size * 0.2),
    //                 child: SvgPicture.asset(
    //                   AppAssets.user,
    //                 ),
    //               ),
    //             ),
    //           ),
    //   ),
    // );
