import 'package:mocktail/mocktail.dart';
import 'package:nice_and_healthy/src/features/authentication/data/fake_auth_repository.dart';
import 'package:nice_and_healthy/src/features/authentication/domain/app_user.dart';
import 'package:nice_and_healthy/src/features/cart/application/cart_service.dart';
import 'package:nice_and_healthy/src/features/cart/data/local/local_cart_repository.dart';
import 'package:nice_and_healthy/src/features/cart/data/remote/remote_cart_repository.dart';
import 'package:nice_and_healthy/src/features/checkout/application/fake_checkout_service.dart';
import 'package:nice_and_healthy/src/features/orders/data/fake_orders_repository.dart';
import 'package:nice_and_healthy/src/features/products/data/fake_products_repository.dart';
import 'package:nice_and_healthy/src/features/reviews/application/reviews_service.dart';
import 'package:nice_and_healthy/src/features/reviews/data/fake_reviews_repository.dart';

const testEmail = 'test@test.ru';
const testPassword = 'test1234';
final testUid = testEmail.split('').reversed.join();
final testUser = AppUser(uid: testUid, email: testEmail);

class MockAuthRepository extends Mock implements FakeAuthRepository {}

class MockRemoteCartRepository extends Mock implements RemoteCartRepository {}

class MockLocalCartRepository extends Mock implements LocalCartRepository {}

class MockCartService extends Mock implements CartService {}

class MockProductsRepository extends Mock implements FakeProductsRepository {}

class MockOrdersRepository extends Mock implements FakeOrdersRepository {}

class MockCheckoutService extends Mock implements FakeCheckoutService {}

class MockReviewsRepository extends Mock implements FakeReviewsRepository {}

class MockReviewsService extends Mock implements ReviewsService {}
