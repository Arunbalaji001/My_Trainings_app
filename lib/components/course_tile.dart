import 'package:flutter/material.dart';
import 'package:my_trainings_app/components/dotted_vertical_painter.dart';
import 'package:my_trainings_app/services/constants.dart';
import 'package:my_trainings_app/services/data_provider.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    required this.trainingData,
    required this.onTapped
  });

  final TrainingData trainingData;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        height: 164,
        width: screenWidth,
        color: Colors.white,
        // margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 16
        ),
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
      child: Row(
        children: [
          SizedBox(
            // flex: 8,
            // fit: FlexFit.tight,
            width: 124,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '${trainingData.dates},',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                      color: Colors.black,
                      fontSizeDelta: 2,
                      fontWeightDelta: 4
                  ),
                ),
                Text(
                  trainingData.year,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                      color: Colors.black,
                      fontSizeDelta: 2,
                      fontWeightDelta: 4
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  trainingData.timing,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                      color: Colors.blueGrey,
                      fontSizeDelta: -2,
                      fontWeightDelta: 2
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${trainingData.place},\n${trainingData.location}',
                      style: Theme.of(context).textTheme.bodySmall?.apply(
                          color: Colors.black,
                          fontWeightDelta: 3
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(width: 12,),
          CustomPaint(
              size: const Size(1.6, double.infinity),
              painter: DashedLineVerticalPainter()
          ),
          const SizedBox(width: 12,),
          Flexible(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  switch(trainingData.status) {
                    CourseStatus.fastfilling => 'Filling Fast!',
                    CourseStatus.earlybird => 'Early Bird!',
                    CourseStatus.closed => 'Closed',
                  },
                  style: Theme.of(context).textTheme.bodySmall?.apply(
                      color: TrainingsColors.appHighlightColor,
                      fontWeightDelta: 2
                  ),
                ),
                Text(
                  '${trainingData.courseName} (${trainingData.rating})',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                      color: Colors.black,
                      fontWeightDelta: 3,
                      fontSizeDelta: 1
                  ),
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade300,
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage('assets/person.jpg'),
                            fit: BoxFit.cover
                        )
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keynote Speaker',
                          style: Theme.of(context).textTheme.bodySmall?.apply(
                              color: Colors.black,
                              fontSizeDelta: -1,
                              fontWeightDelta: 2
                          ),
                        ),
                        Text(
                          trainingData.speakerName,
                          style: Theme.of(context).textTheme.bodySmall?.apply(
                              color: Colors.blueGrey,
                              fontWeightDelta: 2,
                              fontSizeDelta: 0
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () => onTapped(),
                      child: Container(
                        height: 32,
                        width: 120,
                        // padding: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                         color: TrainingsColors.appHighlightColor,
                         borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child:  Text(
                          'Enrol Now',
                          style: Theme.of(context).textTheme.bodyMedium?.apply(
                              color: Colors.white,
                              fontWeightDelta: 3,
                              fontSizeDelta: 1
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
