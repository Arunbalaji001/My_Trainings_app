
enum CourseStatus{fastfilling, earlybird, closed}

class TrainingData{
  String dates;
  String year;
  String timing;
  String courseName;
  CourseStatus status;
  String speakerName;
  String place;
  String location;
  double rating;
  String image;


  TrainingData({
    required this.dates,
    required this.year,
    required this.timing,
    required this.courseName,
    required this.status,
    required this.speakerName,
    required this.place,
    required this.location,
    this.rating=0,
    this.image='image_1'
});
}


class Trainings{

  Trainings._();

  static List<TrainingData> trainings=[
    TrainingData(
        dates: 'Oct 11-13',
        year: '2024',
        timing: '08.30 am - 12.30 pm',
        speakerName: 'Helen Gribble',
        status: CourseStatus.fastfilling,
        courseName: 'Safe Scrum Master',
        place: 'Convention Hall',
        location: 'New Jersey',
        rating: 3.6,
        image: 'image_1'
    ),
    TrainingData(
        dates: 'Nov 17-23',
        year: '2024',
        timing: '10.30 am - 02.30 pm',
        speakerName: 'John Smith',
        status: CourseStatus.earlybird,
        courseName: 'Agile - Master Class',
        place: 'City Hall',
        location: 'San Francisco',
        rating: 4.2,
        image: 'image_2'
    ),
    TrainingData(
        dates: 'Jan 05-15',
        year: '2024',
        timing: '8.30 am - 12.30 pm',
        speakerName: 'Smithson JR',
        status: CourseStatus.fastfilling,
        courseName: 'Web Development',
        place: 'Chrysler Building',
        location: 'New York',
        rating: 4.6,
        image: 'image_3'
    ),
    TrainingData(
        dates: 'Jun 16-25',
        year: '2024',
        timing: '04.30 pm - 08.30 pm',
        speakerName: 'Angelina parker',
        status: CourseStatus.closed,
        courseName: 'UI/UX - Introduction',
        place: 'Convention Hall',
        location: 'New Jersey',
        rating: 4.5,
        image: 'image_2'
    ),
    TrainingData(
        dates: 'Oct 11-13',
        year: '2024',
        timing: '8.30 am - 12.30 pm',
        speakerName: 'Logan',
        status: CourseStatus.fastfilling,
        courseName: 'Java - Fundamentals',
        place: 'Chase Tower',
        location: 'Texas',
        rating: 4.1,
        image: 'image_1'
    ),
    TrainingData(
        dates: 'Jan 11-13',
        year: '2024',
        timing: '8.30 am - 12.30 pm',
        speakerName: 'Helen Gribble',
        status: CourseStatus.earlybird,
        courseName: 'Machine Learning',
        place: 'Convention Hall',
        location: 'New Jersey',
        rating: 4.8,
        image: 'image_3'
    ),
    TrainingData(
        dates: 'Oct 11-13',
        year: '2024',
        timing: '8.30 am - 12.30 pm',
        speakerName: 'John Smith',
        status: CourseStatus.fastfilling,
        courseName: 'Web Development - Pro',
        place: 'Convention Hall',
        location: 'San Francisco',
        rating: 3.2,
        image: 'image_2'
    ),
    TrainingData(
        dates: 'July 11-13',
        year: '2024',
        timing: '8.30 am - 12.30 pm',
        speakerName: 'Logan',
        status: CourseStatus.earlybird,
        courseName: 'Python - For Web',
        place: 'Convention Hall',
        location: 'Manhattan',
        rating: 4.4,
        image: 'image_1'
    ),
    TrainingData(
        dates: 'Feb 11-13',
        year: '2024',
        timing: '8.30 am - 12.30 pm',
        speakerName: 'Angelina parker',
        status: CourseStatus.closed,
        courseName: 'Backend Dev',
        place: 'Convention Hall',
        location: 'Texas',
        rating: 4.9,
        image: 'image_3'
    ),
  ];

}