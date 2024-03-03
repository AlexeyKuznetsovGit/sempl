import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'st_onboarding_screen.dart';

part 'cb_onboarding_screen.freezed.dart';

class CbOnboardingScreen extends Cubit<StOnboardingScreen> {
  CbOnboardingScreen() : super(const StOnboardingScreen.init());
}
