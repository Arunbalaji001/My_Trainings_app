import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_trainings_app/filter_data_selected_model.dart';
import 'package:my_trainings_app/services/data_provider.dart';

part 'training_data_state.dart';

class TrainingDataCubit extends Cubit<TrainingDataState> {


  TrainingDataCubit() : super(TrainingDataNormal(trainingData: Trainings.trainings));


  Future<void> filterData({required FilterDataSelected filterData}) async{
    // List<TrainingData> filteredTrainingData= Trainings.trainings.where((element) => (filterData.filteredLocations.contains(element.location)||filterData.filteredCourses.contains(element.courseName)||filterData.filteredTrainers.contains(element.speakerName)),).toList();
    List<TrainingData> filteredTrainingData = Trainings.trainings.where((element) =>
    (filterData.filteredLocations.isEmpty || filterData.filteredLocations.contains(element.location)) &&
        (filterData.filteredCourses.isEmpty || filterData.filteredCourses.contains(element.courseName)) &&
        (filterData.filteredTrainers.isEmpty || filterData.filteredTrainers.contains(element.speakerName))
    ).toList();

    emit(TrainingDataFiltered(filteredTrainingData: filteredTrainingData));
  }

  void clearFilter()=>emit(TrainingDataNormal(trainingData: Trainings.trainings));

}
