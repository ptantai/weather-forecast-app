import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../domain/entity/weather.dart';
import '../../resources/generated/assets.gen.dart';
import '../../utilities/debouncer.dart';
import 'bloc/weather_bloc.dart';

class SearchWeatherScreen extends StatefulWidget {
  const SearchWeatherScreen({super.key});

  @override
  State<SearchWeatherScreen> createState() => _SearchWeatherScreenState();
}

class _SearchWeatherScreenState extends State<SearchWeatherScreen> {
  final debouncer = Debouncer(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather Today',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SearchWidget(
              onChanged: (value) {
                debouncer.run(
                  () {
                    context.read<WeatherBloc>().add(OnLocationChanged(value));
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Assets.images.introSunsetLottie.lottie(),
                        Text(
                          'how\'s today weather?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .fontSize,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is LoadWeatherDone) {
                  return WeatherInformation(data: state.result);
                } else if (state is FailureState) {
                  return const ErrorView();
                }
                return Center(child: Assets.images.introSunsetLottie.lottie());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.1, vertical: height * 0.05),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.iconWeatherApp.image(),
              const Text(
                'Opps! Are you missing somethings?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          )),
    );
  }
}

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({super.key, required this.data});
  final Weather data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              data.location?.name ?? '',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            data.location?.localtime ?? '',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          LottieBuilder.asset(
            _buildWeatherIcon(data.current?.condition?.code),
            width: 144,
            height: 144,
          ),
          // °
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${data.current?.tempC?.toInt()}\u00b0',
                  style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.displayLarge!.fontSize,
                  ),
                ),
                Text(
                  'C',
                  style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.displayLarge!.fontSize,
                  ),
                ),
              ],
            ),
          ),
          Text(
            data.current?.condition?.text ?? '',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  String _buildWeatherIcon(int? code) {
    switch (code) {
      case 1000:
        return Assets.images.sunnyLottie.path;
      case 1003:
      case 1006:
        return Assets.images.cloudyLottie.path;
      case 1009:
      case 1030:
        return Assets.images.rainyLottie.path;
      default:
        return Assets.images.stormyLottie.path;
    }
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.onChanged});

  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return SearchBar(
      controller: searchController,
      hintText: 'Input city name, zip code,..',
      elevation: MaterialStateProperty.all(1),
      hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
      side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
      trailing: [
        IconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: () {
            onChanged.call(searchController.text);
          },
        )
      ],
      onChanged: onChanged,
    );
  }
}
