import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/image_model.dart';
import '../../models/user_model.dart';
import '../../remote_data_source/details_request.dart';

part 'detailscuibt_state.dart';

class DetailsCubit extends Cubit<DetailscuibtState> {
  DetailsCubit() : super(DetailscuibtInitial());

  Future<void> getUserDetails(int personId) async {
    emit(DetailscuibtLoading());

    try {

      UserModel? userDetails = await DetailsRequest().getUserDetails(personId);

      List<ImageModel>? userImages = await DetailsRequest().getUserImages(personId);


      if (userDetails != null && userImages != null) {
        emit(DetailscuibtSuccess(userDetails, userImages));
      } else {
        emit(DetailscuibtError("no data is found.")); // رسالة خطأ
      }
    } catch (e) {
      emit(DetailscuibtError("error while loading: $e")); // رسالة خطأ
    }
  }
}
