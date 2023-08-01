import 'package:rxdart/rxdart.dart';

class InMemoryStore<T> {
  InMemoryStore(T initial) : _subject = BehaviorSubject<T>.seeded(initial);
  final BehaviorSubject<T> _subject;

  Stream<T> get stream => _subject.stream;
  T get value => _subject.value; // get the latest value from the stream
  set value(T value) =>
      _subject.add(value); // set the latest value to the stream

  void close() => _subject.close();
}
