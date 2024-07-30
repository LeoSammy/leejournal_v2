String tod = getPeriodOfDay();
//Check time of the day and make appropriate greetings
int datetime = DateTime.now().hour;
String getPeriodOfDay() {
  String greeting = '';
  if ( datetime >= 00 && datetime <= 11) {
    greeting = "Morning!";
  } else
  if ( datetime >= 12 && datetime <= 16){
    greeting = "Afternoon!";
  } else
  if (datetime >= 17 && datetime <= 20){
    greeting = "Evening!";
  } else
  if (datetime >= 21 && datetime <= 24){
    greeting = "Night!";
  }
  return greeting;
}