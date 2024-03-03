part of 'cb_auth_screen.dart';

@freezed
abstract class StAuthScreen with _$StAuthScreen{
  const factory StAuthScreen.init() = _Init;
  const factory StAuthScreen.loading() = _Loading;
  const factory StAuthScreen.error(String? error, String message) = _Error;
  const factory StAuthScreen.loaded() = _Loaded;
}