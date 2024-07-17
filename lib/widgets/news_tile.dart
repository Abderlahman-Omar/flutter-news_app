// import 'package:flutter/material.dart';
// import 'package:news_app/models/article_model.dart';

// class NewsTile extends StatelessWidget {
//   const NewsTile({super.key, required this.articleModel});
//   final ArticleModel articleModel;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         ClipRRect(
//           //used when we want to add border to any widgets instead of container
//           borderRadius: BorderRadius.circular(6),
//           child: Image.network(
//             articleModel.image ?? '',
//             height: 200,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Text(
//           articleModel.title ?? '',
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(
//               color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Text(
//           articleModel.subTitle ?? '',
//           maxLines: 2,
//           style: const TextStyle(
//             color: Colors.grey,
//             fontSize: 14,
//           ),
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: articleModel.image != null && articleModel.image!.isNotEmpty
              ? Image.network(
                  articleModel.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      ),
                    );
                  },
                )
              : Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title ?? 'No title available',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.subTitle ?? 'No subtitle available',
          maxLines: 2,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
