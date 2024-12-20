part of 'training_data_cubit.dart';

abstract class TrainingDataState extends Equatable {
  const TrainingDataState();
}

class TrainingDataNormal extends TrainingDataState {

  final List<TrainingData> trainingData;

  const TrainingDataNormal({required this.trainingData});

  @override
  bool operator == (Object other){
    if(other is TrainingDataNormal && other.hashCode == hashCode && other.trainingData.hashCode == trainingData.hashCode){
      return true;
    }
    return false;
  }
  @override
  int get hashCode => identityHashCode(this);

  @override
  List<Object> get props => [trainingData];
}

class TrainingDataFiltered extends TrainingDataState {

  final List<TrainingData> filteredTrainingData;

  const TrainingDataFiltered({required this.filteredTrainingData});

  @override
  bool operator == (Object other){
    if(other is TrainingDataFiltered && other.hashCode == hashCode && other.filteredTrainingData.hashCode == filteredTrainingData.hashCode){
      return true;
    }
    return false;
  }
  @override
  int get hashCode => identityHashCode(this);

  @override
  List<Object> get props => [filteredTrainingData];
}
