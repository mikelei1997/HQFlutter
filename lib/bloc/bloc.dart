import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object implements BaseBloc {
  final _accountController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get accountChanged => _accountController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  //Another way
  // StreamSink<String> get emailChanged => _emailController.sink;
  // StreamSink<String> get passwordChanged => _passwordController.sink;

  Stream<String> get account => _accountController.stream;
  Stream<String> get password => _passwordController.stream;

  String get currentAccount => _accountController.value;
  String get currentPassword => _passwordController.value;

  Stream<bool> get submitCheck =>
      Rx.combineLatest2(account, password, (e, p) => true);

  submit() {
    print("xyx");
  }

  @override
  void dispose() {
    _accountController?.close();
    _passwordController?.close();
  }
}

abstract class BaseBloc {
  void dispose();
}