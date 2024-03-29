part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwitchEvent {
  const SwitchOnEvent();
}

class SwitchOffEvent extends SwitchEvent {
  const SwitchOffEvent();
}
