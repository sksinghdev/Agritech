import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/injector.dart';
import '../cubit/crops_cubit.dart';

@RoutePage()
class CropsPage extends StatelessWidget {
  const CropsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CropsCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Crops')),
        body: BlocBuilder<CropsCubit, CropsState>(
          builder: (context, state) {
            switch (state.status) {
              case CropsStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case CropsStatus.error:
                return Center(child: Text(state.error ?? 'Error'));
              case CropsStatus.success:
                return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (_, i) {
                    final c = state.items[i];
                    return ListTile(
                      leading: Image.network(
                        c.thumbnail,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                      title: Text(c.name),
                      subtitle: Text(c.details),
                    );
                  },
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
