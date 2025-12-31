

import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class GetProductUseCase {
  final ProductRepository productRepository;

  GetProductUseCase(this.productRepository);

  Future<List<ProductEntity>> call() async {
    return productRepository.getProductsList();
  }
}