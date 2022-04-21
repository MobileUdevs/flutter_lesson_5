import 'package:bootcamp_sample_app/theme/app_colors.dart';
import 'package:bootcamp_sample_app/theme/app_text_styles.dart';
import 'package:bootcamp_sample_app/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailedInfoPage extends StatefulWidget {
  const DetailedInfoPage({Key? key}) : super(key: key);

  @override
  State<DetailedInfoPage> createState() => _DetailedInfoPageState();
}

class _DetailedInfoPageState extends State<DetailedInfoPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DetailModel model =
        ModalRoute.of(context)!.settings.arguments as DetailModel;
    final bool isSvg = model.url.contains('svg');
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: controller,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text.toString());
              },
              child: Text("Button")),
          Visibility(
            visible: isSvg,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(
                model.url,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Visibility(
            visible: !isSvg,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                model.url,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Text(
                model.title,
                style: AppTextStyles.appBarTitle,
              ),
              const SizedBox(height: 8),
              Text(
                model.description,
                style: AppTextStyles.body,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
