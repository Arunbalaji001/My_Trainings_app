import 'package:flutter/material.dart';
import 'package:my_trainings_app/services/constants.dart';

class FilterCategoryTile extends StatelessWidget {
  const FilterCategoryTile({
    super.key,
    required this.categoryName,
    required this.isSelected,
    required this.onTapped
  });

  final String categoryName;
  final bool isSelected;
  final VoidCallback onTapped;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapped(),
      child: Container(
        height: 54,
        color: isSelected?Colors.white:Colors.white.withAlpha(100),
        child:
        Row(
          children: [
            isSelected?
            Container(
              height: 54,
              width: 6,
              color: TrainingsColors.appHighlightColor,
            ):Container(
              width: 6,
            ),
            const SizedBox(width: 12,),
            Text(
              categoryName,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: Colors.black,
                  fontSizeDelta: 1,
                  fontWeightDelta: 2
              ),
            ),
          ],
        )
      ),
    );
  }
}

// class FilterCategoryTile extends StatefulWidget {
//   const FilterCategoryTile({
//     super.key,
//     required this.categoryName,
//     required this.isSelected,
//     required this.onTapped
//   });
//
//   final String categoryName;
//   final bool isSelected;
//   final VoidCallback onTapped;
//
//   @override
//   State<FilterCategoryTile> createState() => _FilterCategoryTileState();
// }
//
// class _FilterCategoryTileState extends State<FilterCategoryTile> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
