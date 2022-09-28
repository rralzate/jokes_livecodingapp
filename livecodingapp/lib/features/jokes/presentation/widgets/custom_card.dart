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
            const SizedBox(
              height: 30,
            ),
            Image.network(
              imageUrl,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                // Appropriate logging or analytics, e.g.
                // myAnalytics.recordError(
                //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                //   exception,
                //   stackTrace,
                // );
                return const Text('NO Image');
              },
            ),
            const SizedBox(
              height: 10,
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
