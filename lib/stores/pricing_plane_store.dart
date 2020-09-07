
import 'package:flutterapp/utills/config.dart';
import 'package:mobx/mobx.dart';

part 'pricing_plane_store.g.dart';

class PricingStore = _PricingStore with _$PricingStore;

abstract class _PricingStore with Store {

  @observable
  var showpackageAccordingtoSelection = packageType.Free;

}