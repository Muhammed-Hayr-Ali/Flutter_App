import 'package:application/packages.dart';

enum SourceImage { networkImage, localImage }

class CustomAvatar extends StatelessWidget {
  final SourceImage sourceImage;
  final String imageUrl;
  final double size;
  final Color backgroundColor;
  final double padding;
  final double margin;
  const CustomAvatar({
    super.key,
    required this.imageUrl,
    this.size = 128.0,
    this.backgroundColor = const Color.fromRGBO(245, 245, 245, 1),
    this.padding = 0,
    this.margin = 0,
    this.sourceImage = SourceImage.networkImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: sourceImage == SourceImage.localImage
            ?
            
 imageUrl != '' ?

             Image.file(
                fit: BoxFit.cover,
                File(imageUrl),
              )
              :



DecoratedBox(
                  decoration: BoxDecoration(color: backgroundColor),
                  child: Padding(
                    padding: EdgeInsets.all(size * 0.1),
                    child: SvgPicture.asset(
                      'assets/images/avatar.svg',
                    ),
                  ),
                )



            :
            
            
            
            
            
             CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageUrl,
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
                    padding: EdgeInsets.all(size * 0.1),
                    child: SvgPicture.asset(
                      'assets/images/avatar.svg',
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
