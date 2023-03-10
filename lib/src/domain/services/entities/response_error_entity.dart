class ResponseError {
  final String? message;
  final String? param;
  final String? stackTrace;
  final TypeError? type;

  ResponseError({
    this.message,
    this.param,
    this.stackTrace,
    this.type,
  });
}

enum TypeError {
  not_found,
  not_authorized,
  socket,
  undefined,
}
