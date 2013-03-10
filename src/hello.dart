String dataValue;

void main() {
  DateTime today = new DateTime.now();
  dataValue = 'world ${today.year}-${today.month}-${today.day}';
  print(dataValue);
}
