import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_trainings_app/filter_data_selected_model.dart';
import 'package:my_trainings_app/services/data_provider.dart';

part 'filter_data_state.dart';

class FilterDataCubit extends Cubit<FilterDataState> {

  final List<String> locations= [];
  final List<String> courses= [];
  final List<String> trainers= [];

  FilterDataCubit() : super(FilterDataLocation(locations: const [], filterDataSelected: FilterDataSelected()));
  
  void extrapolateData(){
   List<String> uniqueLocations= Trainings.trainings.fold<List<String>>([],(unique, trainingData){
     if(!unique.any((p) => p == trainingData.location)){
      unique.add(trainingData.location);
     }
     return unique;
   });
   locations.clear();
   locations.addAll(uniqueLocations);

   List<String> uniqueCourses= Trainings.trainings.fold<List<String>>([],(unique, trainingData){
     if(!unique.any((p) => p == trainingData.courseName)){
       unique.add(trainingData.courseName);
     }
     return unique;
   });
   courses.clear();
   courses.addAll(uniqueCourses);


   List<String> uniqueTrainers= Trainings.trainings.fold<List<String>>([],(unique, trainingData){
     if(!unique.any((p) => p == trainingData.speakerName)){
       unique.add(trainingData.speakerName);
     }
     return unique;
   });
   trainers.clear();
   trainers.addAll(uniqueTrainers);
  
   emit(FilterDataLocation(locations: locations,  filterDataSelected: FilterDataSelected()));
  }


  void setFilterLocation()=> emit(FilterDataLocation(locations: locations, filterDataSelected: (state.props.last as FilterDataSelected)));
  void setFilterCourse()=> emit(FilterDataCourse(courses: courses, filterDataSelected: (state.props.last as FilterDataSelected)));
  void setFilterTrainer()=> emit(FilterDataTrainer(trainers: trainers, filterDataSelected: (state.props.last as FilterDataSelected)));

  void updateFilter({required String data}){
    FilterDataSelected filterDataSelected = state.props.last as FilterDataSelected;

    if(state is FilterDataLocation){
      FilterDataSelected updatedFilterData= filterDataSelected.changeData(filterType: filterType, data: data);
      emit(FilterDataLocation(locations: locations, filterDataSelected: updatedFilterData));
    }
    else if(state is FilterDataCourse){
      FilterDataSelected updatedFilterData= filterDataSelected.changeData(filterType: filterType, data: data);
      emit(FilterDataCourse(courses: courses, filterDataSelected: updatedFilterData));

    }
    else{
      FilterDataSelected updatedFilterData= filterDataSelected.changeData(filterType: filterType, data: data);
      emit(FilterDataTrainer(trainers: trainers, filterDataSelected: updatedFilterData));

    }

  }

  void clearFilterSelection()=> emit(FilterDataLocation(locations: locations,  filterDataSelected: FilterDataSelected()));


  FilterType get filterType => (state is FilterDataLocation)?FilterType.location:(state is FilterDataCourse)?FilterType.course:FilterType.trainer;
}
