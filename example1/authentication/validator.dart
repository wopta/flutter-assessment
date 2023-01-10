import 'package:extensions/string_extensions.dart';

class Validator {
  static String? validateField({required String field}) {
    if (field.isEmpty) {
      return 'Questo campo non può essere vuoto';
    }

    return null;
  }

  static String? validateName({required String name}) {
    if (name.isEmpty) {
      return 'Il nome non può essere vuoto';
    }

    return null;
  }

  static String? validateDescription({required String description}) {
    if (description == null) {
      return null;
    }
    if (description.isEmpty) {
      return 'Description can\'t be empty';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'L\'e-mail non può essere vuota';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Inserisci un\'e-mail corretta';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'La password non può essere vuota';
    } else if (password.length < 6) {
      return 'Immettere una password con almeno 6 caratteri';
    }
    return null;
  }

  static String? validateItalianFiscalCode(String? fiscalCode) {
    final italianFiscalCodeRegExp = RegExp(
        r'^(?:[A-Z][AEIOU][AEIOUX]|[AEIOU]X{2}|[B-DF-HJ-NP-TV-Z]{2}[A-Z]){2}(?:[\dLMNP-V]{2}(?:[A-EHLMPR-T](?:[04LQ][1-9MNP-V]|[15MR][\dLMNP-V]|[26NS][0-8LMNP-U])|[DHPS][37PT][0L]|[ACELMRT][37PT][01LM]|[AC-EHLMPR-T][26NS][9V])|(?:[02468LNQSU][048LQU]|[13579MPRTV][26NS])B[26NS][9V])(?:[A-MZ][1-9MNP-V][\dLMNP-V]{2}|[A-M][0L](?:[1-9MNP-V][\dLMNP-V]|[0L][1-9MNP-V]))[A-Z]$');

    if (fiscalCode.isNullOrEmpty()) {
      return 'Il Codice fiscale non può essere vuoto';
    } else if (!italianFiscalCodeRegExp.hasMatch(fiscalCode!)) {
      return 'Inserisci un codice fiscale corretto';
    }

    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber){
    if (phoneNumber.isNullOrEmpty()) {
      return 'Il numero di telefono non può essere vuoto';
    } else if (phoneNumber!.length < 9 || phoneNumber.length > 11) {
      return 'Inserisci un numero di telefono corretto';
    }
    return null;
  }

  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obbligatorio';
    }
    return null;
  }
}
