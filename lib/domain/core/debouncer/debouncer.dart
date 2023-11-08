
import 'dart:async';
import 'dart:ui';
class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  void run(VoidCallback action) {
    // If a timer exists (a function call is pending), cancel it.
    _timer?.cancel();

    // Set a new timer to execute the function after the delay.
    _timer = Timer(delay, action);
  }
}