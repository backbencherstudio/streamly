import 'package:equatable/equatable.dart';

abstract class ViewAllEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadViewAllEvent extends ViewAllEvent {}
