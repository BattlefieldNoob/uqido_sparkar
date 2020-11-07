import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/db/firestore_db.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

enum SparkAREvent { update }

class SparkARState {
  final List<SparkARUser> userList;

  SparkARState(this.userList);
}

class SparkARBloc extends Bloc<SparkAREvent, SparkARState> {
  SparkARBloc() : super(SparkARState(List.empty()));

  FirestoreDB _db = FirestoreDB.getInstance();

  @override
  Stream<SparkARState> mapEventToState(SparkAREvent event) async* {
    print("Executing Event ${event}");
    switch (event) {
      case SparkAREvent.update:
        var sparkARUser = SparkARUser(
            "user",
            List.generate(
                4,
                (index) => SparkAREffect(
                    "Effect-${index}", "testLink", "publicLink", "iconUrl")));
        var newState = SparkARState(await _db.getAllUsers());
        yield newState;
        break;
      default:
        throw UnimplementedError();
        break;
    }
  }
}
