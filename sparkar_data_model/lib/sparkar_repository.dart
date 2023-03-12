import 'package:sparkar_data_model/owner.dart';

mixin SparkARDataSource {
  Future<List<Owner>> fetchData();

  Future<List<String>> getPreferred();
}
