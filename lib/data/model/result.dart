base class Result<T> {}

base class Ok<T> extends Result<T> {
  Ok({required this.value});

  T value;
}

base class Error<T> extends Result<T> {
  Error({required this.error});

  String error;
}
