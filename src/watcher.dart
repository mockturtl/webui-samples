import 'dart:async';
import 'package:web_ui/watcher.dart' as watchers;

int count;

main() {
  count = 0;
  new Timer.periodic(const Duration(seconds: 1), (timer) {
    count++;
    watchers.dispatch();
  });
}
