List<T> fromJsonAsList<T>(
    List<dynamic> jsonList, T Function(Map<String, dynamic>) fromJson) {
  List<T> data = [];
  for (final Map<String, dynamic> json in jsonList) {
    data.add(fromJson(json));
  }
  return data;
}

Future<List<T>> fromJsonAsListAsync<T>(List<dynamic> jsonList,
    Future<T> Function(Map<String, dynamic>) fromJson) async {
  List<T> data = [];
  for (final Map<String, dynamic> json in jsonList) {
    data.add(await fromJson(json));
  }
  return data;
}
