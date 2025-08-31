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
        backgroundColor:  Colors.green.shade100,
        body: BlocBuilder<CropsCubit, CropsState>(
          builder: (context, state) {
            switch (state.status) {
              case CropsStatus.loading:
                return const Center(child: CircularProgressIndicator());

              case CropsStatus.error:
                return Center(
                  child: Text(
                    state.message ?? "An error occurred",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );

              case CropsStatus.loaded:
                return SafeArea(
                  top: false, // Only bottom safe area applied
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        snap: true,
                        pinned: true,
                        expandedHeight: 180,
                        flexibleSpace: FlexibleSpaceBar(
                          title: const Text("🌾 Crops"),
                          background: Container(
                            color: Colors.green.shade400,
                            child: const Center(
                              child: Icon(Icons.eco,
                                  size: 80, color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      // Offline banner
                      if (state.offline)
                        SliverToBoxAdapter(
                          child: Container(
                            width: double.infinity,
                            color: Colors.red.shade400,
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              "You are offline. Showing cached data.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                      // Crop list
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final crop = state.crops[index];
                              return CropCard(crop: crop);
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
