import 'dart:io';

void main() {
  // String Manipulation
  String userInput = getUserInput("Enter a string: ");
  demonstrateStringManipulation(userInput);

  // Collections
  List<String> resultsList = [];
  Set<String> resultsSet = {};
  Map<String, String> resultsMap = {};
  
  resultsList.add(userInput);
  resultsSet.add(userInput);
  resultsMap['original'] = userInput;

  // Print collections
  print("\nList of results: $resultsList");
  print("Set of results: $resultsSet");
  print("Map of results: $resultsMap");

  // File Handling
  writeToFile('output.txt', resultsList);
  readFromFile('output.txt');

  // Date and Time
  logDateTime();
}

String getUserInput(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync() ?? '';
}

void demonstrateStringManipulation(String input) {
  // String Concatenation
  String concatenated = input + " is the input string.";
  print("Concatenated String: $concatenated");

  // String Interpolation
  String interpolated = 'The original string is: $input';
  print("Interpolated String: $interpolated");

  // Substring Extraction
  String substring = input.length > 5 ? input.substring(0, 5) : input;
  print("Substring (first 5 characters): $substring");

  // Case Conversion
  print("Uppercase: ${input.toUpperCase()}");
  print("Lowercase: ${input.toLowerCase()}");

  // Reverse the String
  String reversed = input.split('').reversed.join('');
  print("Reversed String: $reversed");

  // Count Length
  print("Length of String: ${input.length}");
}

void writeToFile(String filename, List<String> data) {
  try {
    File file = File(filename);
    for (var item in data) {
      file.writeAsStringSync('$item\n', mode: FileMode.append);
    }
    print("Data written to $filename successfully.");
  } catch (e) {
    print("Error writing to file: $e");
  }
}

void readFromFile(String filename) {
  try {
    File file = File(filename);
    String contents = file.readAsStringSync();
    print("\nContents of $filename:\n$contents");
  } catch (e) {
    print("Error reading from file: $e");
  }
}

void logDateTime() {
  DateTime now = DateTime.now();
  print("\nCurrent Date and Time: ${now.toLocal()}");

  // Adding days
  DateTime futureDate = now.add(Duration(days: 5));
  print("Date after 5 days: ${futureDate.toLocal()}");

  // Subtracting days
  DateTime pastDate = now.subtract(Duration(days: 5));
  print("Date 5 days ago: ${pastDate.toLocal()}");

  // Difference between two dates
  Duration difference = now.difference(pastDate);
  print("Difference in days: ${difference.inDays}");
}
