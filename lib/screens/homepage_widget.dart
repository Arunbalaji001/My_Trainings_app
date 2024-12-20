import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/components/carousel_widget.dart';
import 'package:my_trainings_app/components/course_tile.dart';
import 'package:my_trainings_app/components/filter_dialog.dart';
import 'package:my_trainings_app/cubits/filter_data_cubit/filter_data_cubit.dart';
import 'package:my_trainings_app/cubits/training_data_cubit/training_data_cubit.dart';
import 'package:my_trainings_app/filter_data_selected_model.dart';
import 'package:my_trainings_app/screens/detailspage_widget.dart';
import 'package:my_trainings_app/services/constants.dart';
import 'package:my_trainings_app/services/data_provider.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {

  final CarouselController carouselController =CarouselController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // carouselController.

    List<TrainingData> tradingData = Trainings.trainings;
    List<CarouselWidget> carouselWidgets = tradingData.map((e) {
      return  CarouselWidget(
        trainingData: e,
        onTapped: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPageWidget(trainingData: e,),)),);
    },).toList();

    return Scaffold(
      body: Container(
        color: Colors.blueGrey.shade50,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
                title: Text(
                  'Trainings',
                  style: Theme.of(context).textTheme.headlineMedium?.apply(
                      color: Colors.white,
                      fontSizeDelta: -2,
                      fontWeightDelta: 1
                  ),
                ),
                centerTitle: false,
                backgroundColor: TrainingsColors.appHighlightColor,
                actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 24,
                  ),
                )
                    ],
              flexibleSpace: SafeArea(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Container(
                    width: screenWidth,
                    padding: const EdgeInsets.only(top: kToolbarHeight),
                    // color: TrainingsColors.appHighlightColor,
                    height: 320,
                    color: TrainingsColors.appHighlightColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            'Highlights',
                            style: Theme.of(context).textTheme.bodyMedium?.apply(
                              color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned.fill(child: Column(
                                children: [
                                  Flexible(
                                    flex: 3,
                                      child: Container(
                                        color: TrainingsColors.appHighlightColor,
                                      )),
                                  Flexible(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.white,
                                      )),
                                ],
                              )),
                              Positioned.fill(child: CarouselSlider(
                                  options:  CarouselOptions(
                                    height: 164,
                                    aspectRatio: 16/9,
                                    viewportFraction: 0.8,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(seconds: 3),
                                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.3,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  items: carouselWidgets
                              ))
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              expandedHeight: screenHeight*0.32,
              pinned: true,
              floating: false,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                width: screenWidth,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 16,),
                padding: const EdgeInsets.only(top: 16),
                child: BlocSelector<FilterDataCubit, FilterDataState, bool>(
                  selector: (filterDataState) {
                    FilterDataSelected filterDataSelected = filterDataState.props.last as FilterDataSelected;
                    if(filterDataSelected.isFilterValid()){
                      context.read<TrainingDataCubit>().filterData(filterData: filterDataSelected);
                      return true;
                    }
                    else if(context.read<TrainingDataCubit>().state is TrainingDataFiltered){
                      context.read<TrainingDataCubit>().clearFilter();
                    }
                    return false;
                  },
                  builder: (context, showClearFilter) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                        onTap: () => showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                        ),
                        backgroundColor: Colors.white,
                        builder: (context) {
                        return const FilterDialog();
                        },),
                        child: Container(
                        height: 28,
                        width: 64,
                        margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey.shade300,
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.tune,
                              color: Colors.blueGrey.shade300,
                              size: 16,
                            ),
                            const SizedBox(width: 4,),
                        Text(
                          'Filter',
                          style: Theme.of(context).textTheme.bodySmall?.apply(
                            color: Colors.blueGrey.shade300,
                            fontSizeDelta: 0,
                            fontWeightDelta: 2
                          ),
                        ),
                          ],
                        ),
                                          ),
                                        ),
                        showClearFilter?
                        InkWell(
                          onTap: () => context.read<FilterDataCubit>().clearFilterSelection(),
                          child: Container(
                            height: 28,
                            width: 108,
                            margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.blueGrey.shade300,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(4)
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.filter_alt_off,
                                  color: Colors.blueGrey.shade300,
                                  size: 16,
                                ),
                                const SizedBox(width: 4,),
                                Text(
                                  'Clear Filters',
                                  style: Theme.of(context).textTheme.bodySmall?.apply(
                                      color: Colors.blueGrey.shade300,
                                      fontSizeDelta: 0,
                                      fontWeightDelta: 2
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ):Container(),
                      ],
                    );
                },
              ),
              ),
            ),
            BlocBuilder<TrainingDataCubit, TrainingDataState>(
              builder: (context, trainingDataState) {
                List<TrainingData> trainingData = trainingDataState.props.first as List<TrainingData>;
                if(trainingData.isNotEmpty) {
                  return SliverList.builder(
                    itemBuilder: (context, index) {
                      return CourseTile(
                        trainingData: trainingData[index],
                        onTapped: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPageWidget(
                                    trainingData: trainingData[index],),)),
                      );
                    },
                    itemCount: trainingData.length,
                  );
                }
                else{
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 240,
                      width: screenWidth,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.browser_not_supported,
                            size: 32,
                            color: Colors.blueGrey,
                          ),
                          const SizedBox(height: 12,),
                          Text(
                            'No matched course found, try clearing filter',
                            style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                  },
                ),
                      ],
                    ),
      ),
    );

  }
}
