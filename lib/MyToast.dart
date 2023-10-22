import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast {
  void showToastMSG() {
    Fluttertoast.showToast(
      msg: "Eingaben erfolgreich gespeichert.",
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 20,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
    );
  }

  void toastMSGFailed() {
    Fluttertoast.showToast(
      msg: "Bitte überprüfen Sie Ihre Eingaben!",
      textColor: Colors.white,
      backgroundColor: Colors.red,
      fontSize: 20,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 3,
    );
  }

  //StateDropdown invalid selection
  void showToastInvalidStateSelection() {
    Fluttertoast.showToast(
      msg: "Bitte wählen Sie Ihr Bundesland!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
      //webPosition: 'center'
    );
  }

  void ungueltigeZahl() {
    Fluttertoast.showToast(
      msg: "Bitte geben Sie ein gültiges Alter ein!",
      textColor: Colors.white,
      backgroundColor: Colors.blue,
      fontSize: 20,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 3,
    );
  }

  void abschlussMSG() {
    Fluttertoast.showToast(
      msg: "Vielen Dank für die Teilnahme an der Umfrage.",
      textColor: Colors.white,
      backgroundColor: Colors.red,
      fontSize: 20,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 3,
    );
  }

  //PetDropdown invalid Selection
  void showToastInvalidPetSelection() {
    Fluttertoast.showToast(
        msg: "Bitte wählen Sie die Art Ihres Haustiers!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
        webPosition: 'center');
  }
}
