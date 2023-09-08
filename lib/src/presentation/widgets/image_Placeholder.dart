import 'package:flutter/material.dart';

import '../../utils/constants/app_strings.dart';

class CustomImagePlaceHolder extends StatelessWidget {
  const CustomImagePlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: const Image(fit: BoxFit.cover,
        image: AssetImage(newsPlaceholderImagePath),
      ),
    );
  }
}
