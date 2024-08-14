import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nice_and_healthy/src/features/cart/application/cart_service.dart';
import 'package:nice_and_healthy/src/features/cart/domain/item.dart';
import 'package:nice_and_healthy/src/features/products/domain/product.dart';

class AddToCartController extends StateNotifier<AsyncValue<int>> {
  AddToCartController({required this.cartService}) : super(const AsyncData(1));

  final CartService cartService;

  void updateQuantity(int quantity) {
    state = AsyncData(quantity);
  }

  Future<void> addToCart(ProductID productId) async {
    final item = Item(productId: productId, quantity: state.value!);
    state = const AsyncLoading<int>().copyWithPrevious(state);
    final value = await AsyncValue.guard(() => cartService.addItem(item));
    if (value.hasError) {
      state = AsyncError<int>(value.error!, value.stackTrace!);
    } else {
      state = const AsyncData(1);
    }
  }
}

// TODO: Should this use autoDispose?
final addToCartControllerProvider =
    StateNotifierProvider<AddToCartController, AsyncValue<int>>((ref) {
  return AddToCartController(
    cartService: ref.watch(cartServiceProvider),
  );
});
