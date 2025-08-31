import 'package:auto_route/auto_route.dart';
import '../features/crops/presentation/pages/crops_page.dart';
import '../features/weather/presentation/pages/weather_page.dart';
import '../features/irrigation/presentation/pages/irrigation_page.dart';
import '../features/market/presentation/pages/market_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CropsRoute.page, path: '/crop', initial: true),
        AutoRoute(page: WeatherRoute.page, path: '/weather'),
        AutoRoute(page: IrrigationRoute.page, path: '/irrigation'),
        AutoRoute(page: MarketRoute.page, path: '/market'),
      ];
}
abstract class $AppRouter extends RootStackRouter {}