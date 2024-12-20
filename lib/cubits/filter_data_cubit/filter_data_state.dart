part of 'filter_data_cubit.dart';

abstract class FilterDataState extends Equatable {
  const FilterDataState();
}

class FilterDataLocation extends FilterDataState {
  final List<String> locations;
  final FilterDataSelected filterDataSelected;
  const FilterDataLocation({required this.locations, required this.filterDataSelected});
  @override
  bool operator == (Object other){
    if(other is FilterDataLocation && other.hashCode == hashCode && other.locations.hashCode == locations.hashCode && other.filterDataSelected.hashCode==filterDataSelected.hashCode){
      return true;
    }
    return false;
  }
  @override
  int get hashCode => identityHashCode(this);

  @override
  List<Object> get props => [locations, filterDataSelected];



}
class FilterDataCourse extends FilterDataState {
  final List<String> courses;
  final FilterDataSelected filterDataSelected;
  const FilterDataCourse({required this.courses, required this.filterDataSelected});
  @override
  bool operator == (Object other){
    if(other is FilterDataCourse && other.hashCode == hashCode && other.courses.hashCode == courses.hashCode && other.filterDataSelected.hashCode==filterDataSelected.hashCode){
      return true;
    }
    return false;
  }
  @override
  int get hashCode => identityHashCode(this);

  @override
  List<Object> get props => [courses, filterDataSelected];
}

class FilterDataTrainer extends FilterDataState {
  final List<String> trainers;
  final FilterDataSelected filterDataSelected;
  const FilterDataTrainer({required this.trainers, required this.filterDataSelected});
  @override
  bool operator == (Object other){
    if(other is FilterDataTrainer && other.hashCode == hashCode && other.trainers.hashCode == trainers.hashCode && other.filterDataSelected.hashCode==filterDataSelected.hashCode){
      return true;
    }
    return false;
  }
  @override
  int get hashCode => identityHashCode(this);

  @override
  List<Object> get props => [trainers, filterDataSelected];
}


