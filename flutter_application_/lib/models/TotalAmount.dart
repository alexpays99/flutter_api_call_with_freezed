import 'package:freezed_annotation/freezed_annotation.dart';

part 'TotalAmount.freezed.dart';
part 'TotalAmount.g.dart';

@unfreezed
class TotalAmount with _$TotalAmount {
  factory TotalAmount({required int total}) = _TotalAmount;

  factory TotalAmount.fromJson(Map<String, Object?> json) =>
      _$TotalAmountFromJson(json);
}
