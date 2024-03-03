part of 'cb_onboarding_screen.dart';

@freezed
abstract class StOnboardingScreen with _$StOnboardingScreen {
  const factory StOnboardingScreen.init() = _Init;
  const factory StOnboardingScreen.loading() = _Loading;
  const factory StOnboardingScreen.error(String? error, String message) = _Error;
  const factory StOnboardingScreen.loaded() = _Loaded;
}