import 'package:flutter/material.dart';

class MovieView extends StatelessWidget {
  const MovieView({
    Key? key,
    this.title,
    this.imageUrl,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final String? imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 204.8,
            width: 137.6,
            child: (imageUrl?.isNotEmpty ?? false)
                ? Image.network(
                    imageUrl!,
                  )
                : null,
          ),
          SizedBox(
            width: 16,
          ),
          Text(title ?? "")
        ],
      ),
    );
  }
}
