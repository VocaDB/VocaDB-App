import 'package:equatable/equatable.dart';

class BaseModel extends Equatable {
  BaseModel();

  BaseModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List<Object> get props => throw UnimplementedError();
}
