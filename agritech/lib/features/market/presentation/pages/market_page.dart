import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/injector.dart';
import '../cubit/market_cubit.dart';

@RoutePage()
class MarketPage extends StatefulWidget {
  const MarketPage({super.key});
  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late final MarketCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = getIt<MarketCubit>()..load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: Scaffold(
          appBar: AppBar(title: const Text('Market Prices')),
          body: BlocBuilder<MarketCubit, MarketState>(builder: (_, s) {
            if (s.status == MarketStatus.loading)
              return const Center(child: CircularProgressIndicator());
            if (s.status == MarketStatus.error)
              return Center(child: Text(s.error ?? 'Error'));
            return ListView(
                children: s.items
                    .map((e) =>
                        ListTile(title: Text(e.crop), trailing: Text(e.price)))
                    .toList());
          }),
        ));
  }
}
