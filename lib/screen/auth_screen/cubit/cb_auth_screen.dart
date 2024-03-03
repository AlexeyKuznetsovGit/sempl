import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'st_auth_screen.dart';

part 'cb_auth_screen.freezed.dart';

class CbAuthScreen extends Cubit<StAuthScreen> {
  CbAuthScreen() : super(const StAuthScreen.init());
}
