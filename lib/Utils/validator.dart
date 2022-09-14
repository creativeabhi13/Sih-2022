class Validator {


  static String? validateCollege({required String? clg}){
    if (clg == null) {
      return null;
    }

    if (clg.isEmpty) {
      return 'Please select a school';
    } else if (clg.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
 }
}