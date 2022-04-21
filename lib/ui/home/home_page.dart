import 'package:bootcamp_sample_app/routes/app_routes.dart';
import 'package:bootcamp_sample_app/theme/app_colors.dart';
import 'package:bootcamp_sample_app/theme/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DetailModel> models = [
    DetailModel(
      title: 'SVG Image',
      url: 'assets/svg/ic_Uzbekistan_flag.svg',
      description:
          ' A widget that will parse SVG data into a Picture using a PictureProvider.\n\n'
          'The picture will be cached using the PictureCache, incorporating any color '
          'filtering used into the key (meaning the same SVG with two different color '
          'arguments applied would be two cache entries).',
    ),
    DetailModel(
      title: 'PNG Image',
      url: 'assets/png/dart_side_png.png',
      description:
          'Flutter apps can include both code and assets (sometimes called resources).'
          ' An asset is a file that is bundled and deployed with your app, and is accessible'
          ' at runtime. Common types of assets include static data (for example, JSON files),'
          ' configuration files, icons, and images (JPEG, WebP, GIF, animated WebP/GIF, PNG, BMP, and WBMP).',
    ),
    DetailModel(
      title: 'JPG Image',
      url: 'assets/jpg/flutter_jpg.jpg',
      description:
          'The assets subsection of the flutter section specifies files that should be included '
          'with the app. Each asset is identified by an explicit path (relative to the pubspec.yaml file)'
          ' where the asset file is located. The order in which the assets are declared doesn’t matter.'
          ' The actual directory name used (assets in first example or directory in the above example) doesn’t matter.'
          '\n\n During a build, Flutter places assets into a special archive called the asset bundle that apps read from at runtime',
    ),
    DetailModel(
      title: 'GIF video',
      url: 'assets/gif/giphy.gif',
      description:
          'The build process supports the notion of asset variants: different versions of'
          ' an asset that might be displayed in different contexts. When an asset’s path is'
          ' specified in the assets section of pubspec.yaml, the build process looks for any '
          'files with the same name in adjacent subdirectories. Such files are then included '
          'in the asset bundle along with the specified asset.',
    ),
  ];
  String title = "Home page";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title:  Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),

                child: Material(
                  color: AppColors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),

                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    onTap: () async {
                      final result = await Navigator.of(context).pushNamed(
                        AppRoutes.detailedInfo,
                        arguments: models[0],
                      );
                      if (result != null) {
                        setState(() {
                          title = result.toString();
                        });
                      }
                    },
                    child: Ink(
                      width: width / 2.3,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SvgPicture.asset(
                              'assets/svg/ic_Uzbekistan_flag.svg',
                              height: 100,
                              width: 130,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(height: 38),
                          const Text(
                            'Svg Image',
                            style: AppTextStyles.appBarTitle,
                          ),
                          const Text(
                            'Scalable Vector Graphics',
                            style: AppTextStyles.body,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(12),
                      //   child: SvgPicture.network(
                      //     'https://freesvg.org/img/Uzbekistan-Map-Flag.png',
                      //     semanticsLabel: 'A shark?!',
                      //     placeholderBuilder: (BuildContext context) => const Center(
                      //         child: CircularProgressIndicator()),
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.detailedInfo,
                    arguments: models[1],
                  );
                },
                child: Container(
                  width: width / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/png/linux_png.png',
                        height: 130,
                        width: 130,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Png Image',
                        style: AppTextStyles.appBarTitle,
                      ),
                      const Text(
                        'Portable Graphics Format',
                        style: AppTextStyles.body,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.detailedInfo,
                    arguments: models[2],
                  );
                },
                child: Container(
                  width: width / 2.3,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/jpg/flutter_jpg.jpg',
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 38),
                      const Text(
                        'Jpg Image',
                        style: AppTextStyles.appBarTitle,
                      ),
                      const Text(
                        'Joint Photographic Experts Group',
                        style: AppTextStyles.body,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.detailedInfo,
                    arguments: models[3],
                  );
                },
                child: Container(
                  width: width / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/gif/welcome.gif',
                          height: 130,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Gif',
                        style: AppTextStyles.appBarTitle,
                      ),
                      const Text(
                        'Graphics Interchange Format',
                        style: AppTextStyles.body,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: width / 2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                      height: 130,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(
                              Colors.red,
                              BlendMode.colorBurn,
                            ),
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Cached Network Image',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.appBarTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailModel {
  final String title;
  final String url;
  final String description;

  DetailModel({
    required this.title,
    required this.url,
    required this.description,
  });
}
