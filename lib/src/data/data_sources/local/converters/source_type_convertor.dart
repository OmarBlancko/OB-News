import 'package:floor/floor.dart';

import '../../../../domain/models/source.dart';
class SourceTypeConverter extends TypeConverter<Source?,String> {

  @override
  Source? decode(String databaseValue) {
      final List<String> results = databaseValue.split(',');
      return Source(name: results.first,id: results.last);
  }

  @override
  String encode(Source? value) {
    final String result = '${value!.id}, ${value.name}';
  return result;
  }
}