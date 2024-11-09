enum HttpStatus {
  ok(code: 200),
  notFound(code: 404),
  unauthorized(code: 300),
  serverError(code: 500);

  final int code;
  const HttpStatus({ required this.code });
}