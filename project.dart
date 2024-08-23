import 'dart:io';

List<String> stdName = [];
List<String> stdRoll = [];
List<String> stdSubj = [];
List<String> stdCont = [];
int total = 0;

void enter() {
  stdout.write("\n\n          HOW MANY STUDENTS YOU WANT TO ENTER?? : ");
  int choice = int.parse(stdin.readLineSync()!);
  
  for (int i = total; i < total + choice; i++) {
    stdout.write("\n          ENTER THE DATA OF STUDENT ${i + 1}");
    stdout.write("\n          ***************************\n\n");
    
    stdout.write("          Enter Name     :  ");
    stdName.add(stdin.readLineSync()!);
    
    stdout.write("          Enter Roll no  :  ");
    stdRoll.add(stdin.readLineSync()!);
    
    stdout.write("          Enter Subject  :  ");
    stdSubj.add(stdin.readLineSync()!);
    
    stdout.write("          Enter Contact  :  ");
    stdCont.add(stdin.readLineSync()!);
  }
  
  total += choice;
  print("");
}

void show() {
  if (total == 0) {
    print("\n\n          NO DATA IS ENTERED");
    print("          ******************\n\n\n");
  } else {
    for (int i = 0; i < total; i++) {
      print("\n          DATA OF STUDENT ${i + 1}");
      print("          *****************\n\n");
      print("          Name     :  ${stdName[i]}");
      print("          Roll no  :  ${stdRoll[i]}");
      print("          Subject  :  ${stdSubj[i]}");
      print("          Contact  :  ${stdCont[i]}\n\n\n");
    }
  }
}

void search() {
  if (total == 0) {
    print("\n\n          NO DATA IS ENTERED");
    print("          ******************\n\n\n");
    return;
  }
  
  print("     Press 1 For Search By Student Roll No :");
  print("     Press 2 For Search By Course : ");
  int ans = int.parse(stdin.readLineSync()!);
  
  if (ans == 1) {
    stdout.write("\n          ENTER THE ROLL NUMBER OF STUDENT WHICH YOU WANT TO SEARCH : ");
    String rollno = stdin.readLineSync()!;
    
    for (int i = 0; i < total; i++) {
      if (rollno == stdRoll[i]) {
        print("\n          Name     :  ${stdName[i]}");
        print("          Roll no  :  ${stdRoll[i]}");
        print("          Subject  :  ${stdSubj[i]}");
        print("          Contact  :  ${stdCont[i]}\n\n\n");
        print("          ************************");
        print("          * SEARCHING SUCCESSFUL *");
        print("          ************************\n\n");
        return;
      }
    }
    print("          No student found with Roll No: $rollno");
  } else if (ans == 2) {
    showStudentsByCourse();
  } else {
    print("Invalid input");
  }
}

void update() {
  if (total == 0) {
    print("\n\n          NO DATA IS ENTERED");
    print("          ******************\n\n\n");
  } else {
    stdout.write("\n          ENTER THE ROLL NUMBER OF STUDENT WHICH YOU WANT TO UPDATE : ");
    String rollno = stdin.readLineSync()!;
    
    for (int i = 0; i < total; i++) {
      if (rollno == stdRoll[i]) {
        print("\n          PREVIOUS DATA");
        print("          *************\n\n");
        print("          DATA OF STUDENT ${i + 1}");
        print("          *****************\n");
        print("\n          Name     :  ${stdName[i]}");
        print("          Roll no  :  ${stdRoll[i]}");
        print("          Subject  :  ${stdSubj[i]}");
        print("          Contact  :  ${stdCont[i]}");
        print("\n          ENTER NEW DATA");
        print("          **************\n");
        
        stdout.write("\n          Enter Name     :  ");
        stdName[i] = stdin.readLineSync()!;
        
        stdout.write("\n          Enter Roll no  :  ");
        stdRoll[i] = stdin.readLineSync()!;
        
        stdout.write("\n          Enter Subject  :  ");
        stdSubj[i] = stdin.readLineSync()!;
        
        stdout.write("\n          Enter Contact  :  ");
        stdCont[i] = stdin.readLineSync()!;
        
        print("\n          RECORD UPDATED SUCCESSFULLY\n");
        return;
      }
    }
    print("         Invalid roll number\n");
  }
}

void deleterecord() {
  if (total == 0) {
    print("\n\n          NO DATA IS ENTERED");
    print("          ******************\n\n\n");
  } else {
    stdout.write("\n\n           PRESS 1 TO DELETE ALL STUDENT RECORD\n");
    stdout.write("          PRESS 2 TO DELETE SPECIFIC STUDENT RECORD\n");
    stdout.write("          *********************************\n\n");
    stdout.write("          ENTER YOUR CHOICE : ");
    int a = int.parse(stdin.readLineSync()!);
    
    if (a == 1) {
      stdName.clear();
      stdRoll.clear();
      stdSubj.clear();
      stdCont.clear();
      total = 0;
      print("\n\n          ALL RECORD DELETED SUCCESSFULLY");
      print("          *******************************\n\n");
    } else if (a == 2) {
      stdout.write("\n          ENTER THE ROLL NUMBER OF STUDENT WHICH YOU WANT TO DELETE : ");
      String rollno = stdin.readLineSync()!;
      
      for (int i = 0; i < total; i++) {
        if (rollno == stdRoll[i]) {
          stdName.removeAt(i);
          stdRoll.removeAt(i);
          stdSubj.removeAt(i);
          stdCont.removeAt(i);
          total--;
          print("\n          YOUR REQUIRED RECORD IS DELETED");
          print("          *******************************\n\n");
          return;
        }
      }
      print("          Invalid Roll Number\n");
    } else {
      print("          INVALID INPUT");
      print("          *************\n\n");
    }
  }
}

void showStudentsByCourse() {
  if (total == 0) {
    print("\n\n          NO DATA IS ENTERED");
    print("          ******************\n\n\n");
  } else {
    stdout.write("Enter the course name to show students: ");
    String courseName = stdin.readLineSync()!;
    print("\n\n          Students who selected $courseName");
    print("          ***********************************\n");
    
    for (int i = 0; i < total; i++) {
      if (stdSubj[i].toLowerCase() == courseName.toLowerCase()) {
        print("\n          DATA OF STUDENT ${i + 1}");
        print("          *****************\n\n");
        print("          Name     :  ${stdName[i]}");
        print("          Roll no  :  ${stdRoll[i]}");
        print("          Subject  :  ${stdSubj[i]}");
        print("          Contact  :  ${stdCont[i]}\n\n\n");
      }
    }
  }
}

void login() {
  int attempts = 4;
  
  while (attempts > 0) {
    stdout.write('ENTER Login Id : ');
    String Login_Id = stdin.readLineSync()!;
    stdout.write('ENTER PASSWORD : ');
    String Password = stdin.readLineSync()!;

    if (Login_Id == "abdurrahman" && Password == "123") {
      print("LOGIN SUCCESSFUL\n");

      while (true) {
        stdout.write("          Press 1 to Input Data\n");
        stdout.write("          Press 2 to Display Data\n");
        stdout.write("          Press 3 to Search Data\n");
        stdout.write("          Press 4 to Update Data\n");
        stdout.write("          Press 5 to Delete Data\n");
        stdout.write("          Press 6 to exit\n\n");
        stdout.write("          Enter Number from 1 to 6 : ");

        String value = stdin.readLineSync()!;

        if (value == "1") {
          enter();
        } else if (value == "2") {
          show();
        } else if (value == "3") {
          search();
        } else if (value == "4") {
          update();
        } else if (value == "5") {
          deleterecord();
        } else if (value == "6") {
          print("*************************************** MADE BY *************************************");
          print("*                                                                                     *");
          print("*                                        Abdur Rahman                                        *");
          print("*                                                                                     *");
          print("******************************* THANK YOU FOR VISITING *********************************");
          exit(0);
        } else {
          print("Invalid input\n");
        }
      }
    } else {
      attempts--;
      print("Incorrect email or password. Attempts remaining: $attempts\n");
    }
  }

  print("Too many failed login attempts. Exiting...");
  exit(0);
}

void main() {
  login();
}
