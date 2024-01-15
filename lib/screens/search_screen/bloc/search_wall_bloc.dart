import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_wall_event.dart';
part 'search_wall_state.dart';

class SearchWallBloc extends Bloc<SearchWallEvent, SearchWallState> {
  SearchWallBloc() : super(SearchWallInitial()) {
    on<SearchWallEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
