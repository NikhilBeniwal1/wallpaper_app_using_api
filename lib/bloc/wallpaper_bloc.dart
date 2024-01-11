
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app_using_bloc/data_source_api/remote/api_helper.dart';
import 'package:wallpaper_app_using_bloc/data_source_api/remote/app_exception.dart';
import 'package:wallpaper_app_using_bloc/models/wallpaper_model.dart';

import '../data_source_api/remote/urls.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
ApiHelper  apiHelper;

  WallpaperBloc({required this.apiHelper}) : super(WallpaperInitialState()) {
    on<GetTrendingWallpapers>((event, emit) async {
      emit(WallpaperLoadingState());
      try {
        var rawdata = await apiHelper.getAPI(Urls.TRENDING_WALLPAPER_URL);
        ///loaded state
var wallpaperDataModel = WallPaperDataModel.fromjson(rawdata);
emit(WallpaperLoadedState(mData: wallpaperDataModel));
      } catch(e) {
emit(WallpaperErrorState(errorMsg: (e as AppException).toErrorMsgg()));
/// Error state
      }
    });
 on<GetWallpapers>((event, emit) async {
   emit(WallpaperLoadingState());
   try {
     var rawdata = await apiHelper.getAPI("${Urls.SEARCH_WALLPAPER_URL}?query${event.query}");
     ///loaded state
     var wallpaperDataModel = WallPaperDataModel.fromjson(rawdata);
     emit(WallpaperLoadedState(mData: wallpaperDataModel));
   } catch(e) {
     emit(WallpaperErrorState(errorMsg: (e as AppException).toErrorMsgg()));
     /// Error state
   }
 });

  }
}
