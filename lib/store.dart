import 'package:additive_food/app_state.dart';
import 'package:additive_food/features/splash/splash_reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() { 
    Store<AppState> store = new Store(
        splashReducer,
        initialState: new AppState(false),
  
    );
    return store;
}
