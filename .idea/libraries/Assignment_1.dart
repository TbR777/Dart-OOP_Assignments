// A. Define an interface named Role
abstract class Role {
  void displayRole();
}

// B. Create a class Person
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;

  @override
  void displayRole() {
  }
}

// C. Create a class Student that extends Person
class Student extends Person {
  int studentID;
  double grade;
  List<double> courseScores = [];

  Student(String name, int age, String address, this.studentID, this.grade)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Student');
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

// D. Create another class Teacher that extends Person
class Teacher extends Person {
  int teacherID;
  List<String> coursesTaught = [];

  Teacher(String name, int age, String address, this.teacherID)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void displayCoursesTaught() {
    print('Courses Taught:');
    for (var course in coursesTaught) {
      print('- $course');
    }
  }
}

// E. Create a class StudentManagementSystem
class StudentManagementSystem {
  void execute() {
    // Create instances of Student and Teacher classes
    var student = Student('John Doe', 20, '123 Main Street', 101, 3.5);
    student.courseScores.addAll([90, 85, 82]);

    var teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 501);
    teacher.coursesTaught.addAll(['Math', 'English', 'Bangla']);

    // Display information
    print('Student Information:');
    student.displayRole();
    print('Name: ${student.getName()}');
    print('Age: ${student.getAge()}');
    print('Address: ${student.getAddress()}');
    print('Average Score: ${student.calculateAverageScore()}');

    print('\nTeacher Information:');
    teacher.displayRole();
    print('Name: ${teacher.getName()}');
    print('Age: ${teacher.getAge()}');
    print('Address: ${teacher.getAddress()}');
    teacher.displayCoursesTaught();
  }
}

void main() {
  var system = StudentManagementSystem();
  system.execute();
}
