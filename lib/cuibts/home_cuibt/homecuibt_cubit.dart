import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/home_model.dart';
import '../../remote_data_source/home_request.dart';

part 'homecuibt_state.dart';

class HomecuibtCubit extends Cubit<HomecuibtState> {
  HomecuibtCubit() : super(HomecuibtInitial());
  HomeModel homeModel = HomeModel();

  Future<void> getHomeData() async {
    emit(HomecuibtLoading());

    homeModel = (await HomeRequest().getHomeData())!;

    if (homeModel?.results != null) {
      emit(HomecuibtSuccess(homeModel));
    } else {
      emit(HomecuibtError('حدث خطأ: $e'));
    }
  }
}
