String dataValue;

void main() {
  Date today = new Date.now();
  dataValue = 'world ${today.year}-${today.month}-${today.day}';
  print(dataValue);
}
