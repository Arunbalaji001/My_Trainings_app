import 'package:flutter/material.dart';
import 'package:my_trainings_app/services/constants.dart';
import 'package:my_trainings_app/services/data_provider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.trainingData,
    required this.onTapped
  });

  final TrainingData trainingData;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapped(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          image: DecorationImage(image: AssetImage('assets/carousel_images/${trainingData.image}.jpg'),fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trainingData.courseName,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: Colors.white,
                fontSizeDelta: 4,
                fontWeightDelta: 4
              ),
            ),
            const SizedBox(height: 4,),
            Text(
              '${trainingData.place}, ${trainingData.location} - ${trainingData.dates}',
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: Colors.white,
                fontSizeDelta: -2,
                fontWeightDelta: 2

              ),
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '\$ 1000',
                      style: Theme.of(context).textTheme.bodySmall?.apply(
                          color: TrainingsColors.appHighlightColor,
                          decorationColor: TrainingsColors.appHighlightColor,
                          fontSizeDelta: -2,
                          fontWeightDelta: 2,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                    const SizedBox(width: 4,),
                    Text(
                      '\$ 850',
                      style: Theme.of(context).textTheme.bodySmall?.apply(
                          color: TrainingsColors.appHighlightColor,
                          decorationColor: TrainingsColors.appHighlightColor,
                          fontSizeDelta: 0,
                          fontWeightDelta: 4,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'View Details',
                      style: Theme.of(context).textTheme.bodySmall?.apply(
                          color: Colors.white,
                          fontSizeDelta: -2,
                          // fontWeightDelta: 2

                      ),
                    ),
                    const SizedBox(width: 6,),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 12,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6,)
          ],
        ),
      ),
    );
  }
}
