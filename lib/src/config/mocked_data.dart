import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  id: '1',
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imageUrl: 'assets/fruits/apple.png',
  name: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  id: '2',
  imageUrl: 'assets/fruits/grape.png',
  name: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  id: '3',
  imageUrl: 'assets/fruits/guava.png',
  name: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  id: '4',
  imageUrl: 'assets/fruits/kiwi.png',
  name: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  id: '5',
  imageUrl: 'assets/fruits/mango.png',
  name: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  id: '6',
  imageUrl: 'assets/fruits/papaya.png',
  name: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [apple, grape, guava, kiwi, mango, papaya];

List<String> categories = ['Carnes', 'Cereais', 'Frutas', 'Grãos', 'Verduras'];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 1),
  CartItemModel(item: guava, quantity: 2),
  CartItemModel(item: mango, quantity: 3),
  CartItemModel(item: kiwi, quantity: 4),
];

UserModel user = UserModel(
  name: 'John Doe',
  email: 'johndoe@email.com',
  phone: '54999999999',
  document: '123.456.789-10',
  password: 'pwd@123',
);

List<OrderModel> orders = [
  OrderModel(
    id: '003',
    copyAndPaste: '123123a',
    total: 123.45,
    items: cartItems,
    status: 'pending_payment',
    createdAt: DateTime.now(),
    paymentOverdueAt: DateTime.now().add(const Duration(days: 5)),
  ),
  OrderModel(
    id: '002',
    copyAndPaste: '123123b',
    total: 123.45,
    items: cartItems,
    status: 'delivered',
    createdAt: DateTime.now(),
    paymentOverdueAt: DateTime.now().add(const Duration(days: 5)),
  ),
  OrderModel(
    id: '001',
    copyAndPaste: '123123c',
    total: 11,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      )
    ],
    status: 'delivered',
    createdAt: DateTime.parse('2024-05-23 01:10:10.101'),
    paymentOverdueAt: DateTime.parse('2024-05-23 02:10:10.101'),
  ),
];
