part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class GetTrendingWallpapers extends WallpaperEvent {}

 class GetWallpapers extends WallpaperEvent {
 String query ;
 GetWallpapers({ this.query = "nature"});

 }