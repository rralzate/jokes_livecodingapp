import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String? name;
  final bool existIcon;

  const CustomCard(
      {Key? key, required this.imageUrl, this.name, required this.existIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 30,
        shadowColor: AppTheme.primary.withOpacity(0.5),
        child: Column(
          children: [
            FadeInImage(
              image: existIcon
                  ? NetworkImage(imageUrl)
                  : const NetworkImage(
                      "https://img.icons8.com/plasticine/400/chuck-norris.png"),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
            ),
            if (name != null)
              Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding: const EdgeInsets.all(10),
                  child: Text(name ?? 'No Title'))
          ],
        ));
  }
}
