import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/injector.dart';
import '../cubit/crops_cubit.dart';
import '../widgets/crop_card.dart';

@RoutePage()
class CropsPage extends StatelessWidget {
  const CropsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CropsCubit>()..load(),
      child: Scaffold(
        body: BlocBuilder<CropsCubit, CropsState>(
          builder: (context, state) {
            switch (state.status) {
              case CropsStatus.loading:
                return const Center(child: CircularProgressIndicator());

              case CropsStatus.error:
                return Center(
                    child: Text(state.message ?? "An error occurred"));

              case CropsStatus.loaded:
                return SafeArea(
                  top: false,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        snap: true,
                        pinned: true,
                        expandedHeight: 160,
                        flexibleSpace: FlexibleSpaceBar(
                          title: const Text("🌾 Crops"),
                          background: Container(
                            color: Colors.green.shade200,
                            child: const Center(
                              child: Icon(Icons.eco,
                                  size: 80, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      if (state.offline)
                        SliverToBoxAdapter(
                          child: Container(
                            width: double.infinity,
                            color: Colors.red.shade300,
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              "You are offline. Showing cached data.",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final crop = state.crops[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: CropCard(crop: crop),
                              );
                            },
                            childCount: state.crops.length,
                          ),
                        ),
                      ),
                    ],
                  ),
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
