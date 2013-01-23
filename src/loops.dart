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
  var lQuery = query.toLowerCase();
  var res = fruits.where((v) => v.toLowerCase().contains(lQuery));
  return (res.length <= 20) ? res.toList()
    : (res.take(20).toList()..add('...and many more'));
}

bool get noMatches => results.isEmpty;

main() {}
