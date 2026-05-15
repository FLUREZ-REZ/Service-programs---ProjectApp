import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gallery_provider.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GalleryProvider>();
    final items = provider.items;

    if (provider.isLoading && items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;


        const crossAxisCount = 3;


        final spacing = (width < 360) ? 6.0 : 8.0;


        final cardWidth = (width - (spacing * (crossAxisCount + 1))) / crossAxisCount;


        final imageHeight = cardWidth * 0.7;


        final titleFontSize = (width < 360) ? 10.0 : 7.7;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: spacing, vertical: spacing),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,


            ),
            itemBuilder: (context, index) {
              final item = items[index];

              return Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: const Color.fromRGBO(13, 15, 20, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    SizedBox(
                      height: imageHeight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),


                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontFamily: 'iran',
                        fontWeight: FontWeight.w200,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
