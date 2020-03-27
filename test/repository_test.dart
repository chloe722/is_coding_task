
import 'package:flutter_test/flutter_test.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/repository.dart';


void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  test("Json file should be loaded", () async {

    final repository = Repository();

    List<BikeItem> result = await repository.loadBikes();

    expect(result, hasLength(greaterThan(1)));

  });


}