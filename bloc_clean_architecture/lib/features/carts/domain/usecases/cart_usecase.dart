


import '../entities/cart_entity.dart';
import '../repository/carts_repository.dart';

class GetCartUseCase{
  final CartRepository cartRepository;

  GetCartUseCase(this.cartRepository);
  Future<List<CartEntity>> call() async{
    return await cartRepository.getCart();
  }
}
