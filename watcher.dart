import 'dart:html' as html;
import 'package:web_ui/watcher.dart' as watchers;

int count;

main() {
  count = 0;
  html.window.setInterval(() {
    count++;
    watchers.dispatch();
  }, 1000);
}
