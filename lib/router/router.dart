import 'package:auto_route/auto_route.dart';
import 'package:sempl/screen/auth_screen/auth_screen.dart';
import 'package:sempl/screen/onboarding_screen/onboarding_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Widget|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnBoardingRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
      ];
}
