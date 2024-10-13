part of 'homecuibt_cubit.dart';

@immutable
sealed class HomecuibtState {}

final class HomecuibtInitial extends HomecuibtState {}
class HomecuibtLoading extends HomecuibtState {}
class HomecuibtSuccess extends HomecuibtState {
  final HomeModel homemodel;

  HomecuibtSuccess(this.homemodel);
}
class HomecuibtError extends HomecuibtState{
  final String message;

  HomecuibtError(this.message);
}