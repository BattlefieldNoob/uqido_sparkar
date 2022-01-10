import 'package:sparkar_data_model/sparkar_network_data.dart';

mixin SparkARDataSource{

  Future<SparkARNetworkData> getData();

  Future<List<String>> getPreferred();

}