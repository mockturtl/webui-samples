String query = '';

List<String> fruits = const [ 'Apple', 'Apricot', 'Avocado',
    'Banana', 'Blackberry', 'Blackcurrant', 'Blueberry',
    'Currant', 'Cherry', 'Clementine', 'Date', 'Durian', 'Fig',
    'Gooseberry', 'Grape', 'Grapefruit', 'Guava', 'Huckleberry',
    'Kiwi', 'Lemon', 'Lime', 'Lychee', 'Mandarin', 'Mango',
    'Cantaloupe', 'Honeydew melon', 'Nectarine', 'Orange',
    'Peach', 'Pear', 'Plum', 'Pineapple', 'Pomegranate',
    'Raspberry', 'Redcurrant', 'Star fruit', 'Strawberry',
    'Tangerine', 'Tomato', 'Watermelon'];

List<String> get results {
  List<String> res = fruits.filter(
      (v) => v.toLowerCase().contains(query.toLowerCase()));
  if (res.length > 20) {
    res.length = 20;
    res.add('... and many more');
  }
  return res;
}

bool get noMatches => results.isEmpty;

main() {}
