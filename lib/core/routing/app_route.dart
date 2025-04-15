import 'package:go_router/go_router.dart';
import 'package:travel_app/core/model/model.dart';
import 'package:travel_app/presentation/page/New_password.dart';
import 'package:travel_app/presentation/page/create_acount4.dart';
import 'package:travel_app/presentation/page/detail.dart';
import 'package:travel_app/presentation/page/forgot_password.dart';
import 'package:travel_app/presentation/page/home.dart';
import 'package:travel_app/presentation/page/intro.dart';
import 'package:travel_app/presentation/page/kuta.dart';
import 'package:travel_app/presentation/page/login.dart';
import 'package:travel_app/presentation/page/register.dart';
import 'package:travel_app/presentation/page/search.dart';
import 'package:travel_app/presentation/page/splash_screen.dart';
import 'package:travel_app/presentation/page/succes_otp.dart';

part 'route_name.dart'; //bapak

final appRoute = GoRouter(routes: [
  GoRoute(
    path: '/home',
    name: Routes.home,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/',
    name: Routes.splash,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: '/intro',
    name: Routes.Intro,
    builder: (context, state) => ScreenIntroduction(),
  ),
  GoRoute(
    path: '/login',
    name: Routes.login,
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(
    path: '/register',
    name: Routes.register,
    builder: (context, state) => RegisterScreen(),
  ),
  GoRoute(
    path: '/forgot_password',
    name: Routes.forgot_password,
    builder: (context, state) => ForgotPasswordScreen(),
  ),
  GoRoute(
    path: '/new_password',
    name: Routes.new_password,
    builder: (context, state) => ResetPasswordPage(),
  ),
  GoRoute(
      path: '/create_acount4',
      name: Routes.otp_verification,
      builder: (context, state) {
        final email = state.extra as String;
        return OTPVerificationScreen(
          email: email,
        );
      }),
  GoRoute(
    path: '/otp_success',
    name: Routes.otp_succes,
    builder: (context, state) => SuccessScreen(),
  ),
  GoRoute(
    path: '/kuta',
    name: Routes.kuta,
    builder: (context, state) => detailScreen(),
  ),
  GoRoute(
    path: '/detail',
    name: Routes.detail,
    builder: (context, state) {
      final _data = state.extra as DetailWisata;
      return DetailScreen(data: _data);
    },
  ),
 GoRoute(
    path: '/search',
    name: Routes.search,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>? ?? {};
      final String searchQuery = extra['searchQuery'] as String? ?? "";
      final int categoryID = extra['categoryID'] as int? ?? 0;
      return SearchScreen(categoryID: categoryID, searchQuery: searchQuery);
    },
  ),

]);
