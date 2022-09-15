part of 'product_cubit.dart';

@freezed
abstract class ShopState with _$ShopState {
  const factory ShopState.initial() = _Initial;
  const factory ShopState.loading() = _Loading;
  const factory ShopState.success(List<ProductModel> products) = _Success;
  const factory ShopState.failure(
    NetworkException? networkException,
    List<ProductModel> products,
  ) = Error;
}
