import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/components/filter_category_tile.dart';
import 'package:my_trainings_app/cubits/filter_data_cubit/filter_data_cubit.dart';
import 'package:my_trainings_app/filter_data_selected_model.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {


  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      elevation: 4,
      backgroundColor: Colors.blueGrey.shade50,
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SizedBox(
      width: screenWidth,
      child: BlocBuilder<FilterDataCubit, FilterDataState>(
     builder: (context, filterDataState) {
       List<String> filterOptions= filterDataState.props.first as List<String>;
       FilterType currentFilterType = context.read<FilterDataCubit>().filterType;
       FilterDataSelected filterDataSelected = filterDataState.props.last as FilterDataSelected;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              top: 12,
              bottom: 12
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sort and Filters',
                  style: Theme.of(context).textTheme.headlineSmall?.apply(
                    color: Colors.black,
                    fontSizeDelta: -2,
                    fontWeightDelta: 1
                  ),
                ),
               InkWell(
                 onTap: () => Navigator.pop(context),
                 child: Container(
                   height: 36,
                   width: 36,
                   margin: const EdgeInsets.only(right: 6),
                   child: Icon(
                     Icons.close,
                     color: Colors.blueGrey.shade200,
                     size: 32,
                   ),
                 ),
               )
              ],
            ),
          ),
          Container(
            color: Colors.blueGrey.shade200,
            width: screenWidth,
            height: 1,
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      FilterCategoryTile(
                          categoryName: 'Location',
                          isSelected: (filterDataState is FilterDataLocation)?true:false,
                          onTapped: () {
                            context.read<FilterDataCubit>().setFilterLocation();
                            },
                      ),
                      FilterCategoryTile(
                        categoryName: 'Training Name',
                        isSelected: (filterDataState is FilterDataCourse)?true:false,
                        onTapped: () {
                          context.read<FilterDataCubit>().setFilterCourse();
                        },
                      ),
                      FilterCategoryTile(
                        categoryName: 'Speaker Name',
                        isSelected: (filterDataState is FilterDataTrainer)?true:false,
                        onTapped: () {
                          context.read<FilterDataCubit>().setFilterTrainer();
                        },
                      ),
                        ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        itemCount: filterOptions.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                              value: filterDataSelected.checkData(filterType: currentFilterType, data: filterOptions[index]),
                              onChanged: (bool? checked)=>context.read<FilterDataCubit>().updateFilter(data: filterOptions[index]),
                              title: Text(
                                filterOptions[index],
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                          );
                        },),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(
            height: 12,
          )
        ],
      );
  },
),
      ),
    );
  }
}
