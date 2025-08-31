import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/injector.dart';
import '../cubit/weather_cubit.dart';

@RoutePage()
class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WeatherCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (_, s) {
            if (s.status == WeatherStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (s.status == WeatherStatus.error) {
              return Center(child: Text(s.error ?? 'Error'));
            }

            final w = s.data;
            if (w == null) return const SizedBox.shrink();

            return ListView(
              children: [
                ListTile(title: Text('Location: ${w.location}')),
                ...w.forecast.map(
                  (f) => ListTile(
                    title: Text(f.day),
                    subtitle: Text('${f.temperature} • ${f.condition}'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
