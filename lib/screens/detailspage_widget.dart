import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_trainings_app/services/constants.dart';
import 'package:my_trainings_app/services/data_provider.dart';

class DetailsPageWidget extends StatelessWidget {
   DetailsPageWidget({
    super.key,
    required this.trainingData
  });
  final TrainingData trainingData;

  final int randomValue = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TrainingsColors.appHighlightColor,
        title: Text(
          '${trainingData.courseName} (${trainingData.rating})',
          style: Theme.of(context).textTheme.bodyLarge?.apply(
            color: Colors.white,
              fontSizeDelta: 1,
            fontWeightDelta: 1
          ),
        ),
        automaticallyImplyLeading: true,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the color of the back button
        ),

      ),
      body: Column(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight*0.32,
            child: Image.asset(
              'assets/carousel_images/${trainingData.image}.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        fontWeightDelta: 4
                    ),
                  ),
                  Text(
                    '${trainingData.courseName} (${trainingData.rating})',
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: Colors.black,
                        fontWeightDelta: 6,
                        fontSizeDelta: 4
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
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
                                fontSizeDelta: 2,
                                fontWeightDelta: 2
                            ),
                          ),
                          Text(
                            trainingData.speakerName,
                            style: Theme.of(context).textTheme.bodySmall?.apply(
                                color: Colors.blueGrey,
                                fontWeightDelta: 2,
                                fontSizeDelta: 2
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${trainingData.dates},',
                            style: Theme.of(context).textTheme.bodyMedium?.apply(
                                color: Colors.black,
                                fontSizeDelta: 4,
                                fontWeightDelta: 4
                            ),
                          ),
                          Text(
                            trainingData.year,
                            style: Theme.of(context).textTheme.bodyMedium?.apply(
                                color: Colors.black,
                                fontSizeDelta: 4,
                                fontWeightDelta: 4
                            ),
                          ),
                        ],
                      ),
                      Text(
                        trainingData.timing,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(
                            color: Colors.blueGrey,
                            fontSizeDelta: 0,
                            fontWeightDelta: 2
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${trainingData.place}, ${trainingData.location}',
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: Colors.black,
                        fontWeightDelta: 3
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Summary',
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: Colors.blueGrey,
                        fontSizeDelta: 4,
                        fontWeightDelta: 4
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
