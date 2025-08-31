import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/injector.dart';
import '../cubit/irrigation_cubit.dart';

@RoutePage()
class IrrigationPage extends StatefulWidget {
  const IrrigationPage({super.key});
  @override
  State<IrrigationPage> createState() => _IrrigationPageState();
}

class _IrrigationPageState extends State<IrrigationPage> {
  late final IrrigationCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = getIt<IrrigationCubit>()..load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: Scaffold(
          appBar: AppBar(title: const Text('Irrigation')),
          body: BlocBuilder<IrrigationCubit, IrrigationState>(builder: (_, s) {
            if (s.status == IrrigationStatus.loading)
              return const Center(child: CircularProgressIndicator());
            if (s.status == IrrigationStatus.error)
              return Center(child: Text(s.error ?? 'Error'));
            return ListView(
                children: s.items
                    .map((e) => ListTile(
                        title: Text(e.name), subtitle: Text(e.schedule)))
                    .toList());
          }),
        ));
  }
}
