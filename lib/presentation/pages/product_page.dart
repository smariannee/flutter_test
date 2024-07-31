import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/Product_model.dart';
import '../../presentation/cubits/Product_cubit.dart';
import '../../presentation/cubits/Product_state.dart';
import '../../repository/Product_repository.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: BlocProvider(
        create: (context) => ProductCubit(repository: context.read<ProductRepository>())..getProducts(),
        child: ProductView(),
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          return Center(child: Text('Please wait...'));
        } else if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductSuccess) {
          return ProductList(products: state.products);
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('Unknown state'));
        }
      },
    );
  }
}

class ProductList extends StatelessWidget {
  final List<ProductModel> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stock: ${product.stock}    Price: \$${product.price}',
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                product.description,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          leading: SizedBox(            
            child: Image.network(product.image, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
