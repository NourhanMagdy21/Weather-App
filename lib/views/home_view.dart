import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_info.dart';
import 'package:weather_app/widgets/weather_info.dart';
//import 'package:weather_app/widgets/weather_info.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return SearchView();
            }));
          }, icon:Icon(Icons.search))

        ],
      ),
      body:BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder:(context,state){
          if(state is WeatherInitialState ){
            return NoWeatherInfo();
          } else if(state is WeatherLoadedStates){
            return WeatherInfo();
          }else{
            return Center(child: Text('Oops! there was an error'));
          }
        },
      ),
    );
  }
}
