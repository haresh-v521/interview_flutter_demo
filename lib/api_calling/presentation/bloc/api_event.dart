abstract class ApiEvent {}

//Login Events here,

class GetApiEvent extends ApiEvent {
  GetApiEvent();
}
class SingleCheckEvent extends ApiEvent {
  final bool isCheck;
  SingleCheckEvent({this.isCheck});
}
