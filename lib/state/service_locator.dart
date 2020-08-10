
import 'package:get_it/get_it.dart';
import 'package:scroll_book/state/state.dart';
GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerSingleton(AppState());
  locator.registerSingleton(LibState());
  locator.registerSingleton(ReaderController());
 
}
