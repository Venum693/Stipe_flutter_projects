
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/mapbox_search_model.dart';
import '../widgets/app_colors.dart';

class SearchScreen extends SearchDelegate<SearchPlaces> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: AppBarTheme(color: AppColors.black),
        //backgroundColor: AppColors.yellow,
        textTheme:
        TextTheme(headline6: GoogleFonts.poppins(color: AppColors.text)),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: AppColors.text),
        ));
  }

  MapBoxApi mapBoxApi = MapBoxApi();
  List<SearchPlaces?> empty = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => MapBoxScreen(),
        //     ));
        //close(context, null!);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(

      //The list is not shown until the user enters a 4th character
        future: query.length > 2 ? mapBoxApi.mapBoxPlaces(query) : null,
        builder: (context, snapshot) {
          return snapshot.hasData
              ?
          // return
          // query.length > 2 ?
          ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (_, i) {
                //final SearchPlaces? search = empty[i];
                return ListTile(
                  title: Text(
                    (snapshot.data![i] as SearchPlaces).placeName!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.text),
                  ),
                  //Text(search!.placeName![i]),
                  leading: Icon(
                    Icons.location_on,
                    color: AppColors.yellow,
                  ),
                  onTap: () {
                    //when the List tile is tapped, search screen is closed and the address is shown on the map
                    close(context, snapshot.data![i] as SearchPlaces);
                  },
                );
              })
              : Container(child: Center(child: CircularProgressIndicator()));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Gives a List of places that matches the query
    return FutureBuilder(

      //The list is not shown until the user enters a 4th character
        future: query.length > 2 ? mapBoxApi.mapBoxPlaces(query) : null,
        builder: (context, snapshot) {
          return snapshot.hasData
              ?
          // return
          // query.length > 2 ?
          ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (_, i) {
                //final SearchPlaces? search = empty[i];
                return ListTile(
                  title: Text(
                    (snapshot.data![i] as SearchPlaces).placeName!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.text),
                  ),
                  //Text(search!.placeName![i]),
                  leading: Icon(
                    Icons.location_on,
                    color: AppColors.yellow,
                  ),
                  onTap: () {
                    //when the List tile is tapped, search screen is closed and the address is shown on the map
                    close(context, snapshot.data![i] as SearchPlaces);
                  },
                );
              })
              : Container(child: Center(child: CircularProgressIndicator()));
        });
  }
}
