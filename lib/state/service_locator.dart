
import 'package:get_it/get_it.dart';
import 'package:scroll_book/state/app_state.dart';
GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerSingleton(AppState());
 
}
