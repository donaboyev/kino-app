import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controllers.dart';
import '../../core/custom_widgets/nuts_activity_indicator.dart';
import '../../core/theme/theme.dart';
import '../../data/response/responses.dart';
import '../widgets/more_movie_item_widget.dart';

class DiscoverMorePage extends GetView<DiscoverMoreController> {
  const DiscoverMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrAsset,
      body: SafeArea(
        child: GetBuilder<DiscoverMoreController>(
          builder: (moreController) => moreController.isLoading.value
              ? const Center(child: NutsActivityIndicator())
              : Stack(
                  children: [
                    CustomScrollView(
                      controller: moreController.scrollController,
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          floating: true,
                          backgroundColor: clrAsset,
                          elevation: 0,
                          title: Text(
                            'Discover movies'.toUpperCase(),
                            style: stySectionTitle,
                          ),
                          leading: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () => Get.back(),
                          ),
                        ),
                        SliverAppBar(
                          expandedHeight: 0,
                          backgroundColor: clrAsset,
                          toolbarHeight: 0,
                          pinned: true,
                          elevation: 0,
                          titleSpacing: 0,
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(45),
                            child: SizedBox(
                              height: 45,
                              child: Align(
                                alignment: Alignment.center,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const VerticalDivider(
                                        color: clrTransparent,
                                        width: 0,
                                      ),
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: moreController.genres!.length,
                                  itemBuilder: (context, index) {
                                    final Genre genre =
                                        moreController.genres![index];
                                    return Obx(
                                      () => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RawMaterialButton(
                                          onPressed: () async =>
                                              await moreController
                                                  .setSelectedGenreIndex(index),
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          fillColor:
                                              moreController
                                                      .selectedGenreIndex
                                                      .value ==
                                                  index
                                              ? clrPink
                                              : clrMirage,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          focusElevation: 0,
                                          highlightElevation: 0,
                                          child: Center(
                                            child: Text(
                                              genre.name!,
                                              style: styGenreTitle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        moreController.isLoading.value
                            ? const NutsActivityIndicator()
                            : SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    final Movie movie =
                                        moreController.moviesByGenre[index];
                                    return MoreMovieItemWidget(movie: movie);
                                  },
                                  childCount:
                                      moreController.moviesByGenre.length,
                                ),
                              ),
                      ],
                    ),
                    Obx(
                      () => Visibility(
                        visible: moreController.isDiscoverLoading.value,
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: NutsActivityIndicator(radius: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
