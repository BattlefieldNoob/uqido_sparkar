import 'package:uqido_sparkar/model/sparkar_user.dart';

abstract class AbstractDB {
  Future<List<SparkARUser>?> getAllUsers();
}
