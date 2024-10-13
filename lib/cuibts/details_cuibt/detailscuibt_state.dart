part of 'detailscuibt_cubit.dart';

@immutable
sealed class DetailscuibtState {}

final class DetailscuibtInitial extends DetailscuibtState {}
final class DetailscuibtLoading extends DetailscuibtState {}
final class DetailscuibtSuccess extends DetailscuibtState {
  final UserModel userDetails; // لتخزين تفاصيل المستخدم
  final List<ImageModel> userImages; // لتخزين صور المستخدم

  DetailscuibtSuccess(this.userDetails, this.userImages);
}
final class DetailscuibtError extends DetailscuibtState {

  final String errorMessage; // لتخزين رسالة الخطأ

  DetailscuibtError(this.errorMessage);
}

