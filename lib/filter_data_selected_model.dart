enum FilterType{location, course, trainer}

class FilterDataSelected{
  final List<String> filteredLocations;
  final List<String> filteredCourses;
  final List<String> filteredTrainers;

  FilterDataSelected.withData({
    required this.filteredLocations,
    required this.filteredCourses,
    required this.filteredTrainers
});

  FilterDataSelected():filteredTrainers=[],filteredCourses=[],filteredLocations=[];

  FilterDataSelected changeData({required FilterType filterType, required String data}){
    switch(filterType){
      case FilterType.location:
        int index= filteredLocations.indexWhere((element) => element==data);
        if(index<0){
          filteredLocations.add(data);
        }
        else{
          filteredLocations.removeAt(index);
        }
        break;
      case FilterType.course:
        int index= filteredCourses.indexWhere((element) => element==data);
        if(index<0){
          filteredCourses.add(data);
        }
        else{
          filteredCourses.removeAt(index);
        }
        break;
      case FilterType.trainer:
        int index= filteredTrainers.indexWhere((element) => element==data);
        if(index<0){
          filteredTrainers.add(data);
        }
        else{
          filteredTrainers.removeAt(index);
        }
        break;
    }

    return FilterDataSelected.withData(
        filteredLocations: filteredLocations,
        filteredCourses: filteredCourses,
        filteredTrainers: filteredTrainers);
  }


  bool checkData({required FilterType filterType, required String data}){
    bool isExists=false;
    switch(filterType){
      case FilterType.location:
        if(filteredLocations.contains(data)){
          isExists= true;
        }
        break;
      case FilterType.course:
        if(filteredCourses.contains(data)){
          isExists= true;
        }
        break;
      case FilterType.trainer:
        if(filteredTrainers.contains(data)){
          isExists= true;
        }
        break;
    }
    return isExists;
  }

  bool isFilterValid()=>(filteredLocations.isNotEmpty || filteredCourses.isNotEmpty || filteredTrainers.isNotEmpty)?true:false;


}