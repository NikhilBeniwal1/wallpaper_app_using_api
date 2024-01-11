import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_using_bloc/bloc/wallpaper_bloc.dart';
import '../models/color_model.dart';
import '../models/wallpaper_model.dart';
import 'wallpaper_screen.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WallPaperDataModel? wallpapersData;
  WallPaperDataModel? mtrendigwallpapersData;
  var _searchController = TextEditingController();

  List<ColorModel> mColorList = [
    ColorModel(colorValue: Colors.white, colorCode: "ffffff"),
    ColorModel(colorValue: Colors.black, colorCode: "000000"),
    ColorModel(colorValue: Colors.blue, colorCode: "0000ff"),
    ColorModel(colorValue: Colors.green, colorCode: "00ff00"),
    ColorModel(colorValue: Colors.red, colorCode: "ff0000"),
    ColorModel(colorValue: Colors.purple, colorCode: "9C27B0"),
    ColorModel(colorValue: Colors.orange, colorCode: "FF9800"),
  ];


  @override
  void initState() {
    BlocProvider.of<WallpaperBloc>(context).add(GetTrendingWallpapers());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // String searchWal;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search box
            searchUI(),


            // list of best of month wallpapers







            // coler tone text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "The color tone",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),


            // color tone list
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // margin: EdgeInsets.symmetric(horizontal: 8),
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mColorList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: mColorList[index].colorValue!,
                        ),
                        margin: EdgeInsets.only(right: 6),
                        height: 50,
                        width: 50,

                        //  child: Text("one"),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 5,
            ),


            // text best of months text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Trending Wallpapers",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5,
            ),

              // best of month wallpapers
               bestofMonth(),


          ],
        )
    );
  }

  Widget searchUI(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            hintText: "Find wallpaper...",
            suffixIcon: Icon(
              Icons.search,
              size: 20,
              color: Colors.grey,
            ),
            border: OutlineInputBorder()),
      ),
    );


  }

  Widget bestofMonth() {
    return BlocBuilder<WallpaperBloc, WallpaperState>(
      builder: (context, state) {
        if (state is WallpaperLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WallpaperErrorState) {
          return Center(
            child: Text(state.errorMsg),
          );
        } else if (state is WallpaperLoadedState) {
          mtrendigwallpapersData = state.mData;
          return Container(
            // width: 200,
            height: 220,
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: mtrendigwallpapersData!.photos!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.9 / 1.19,
                    crossAxisCount: 1),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return WallPaperScreen(
                            imageUrl: mtrendigwallpapersData!
                                .photos![index].src!.portrait
                                .toString(),
                          );
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green.shade200,
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${mtrendigwallpapersData!.photos![index].src!.portrait}'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }




}