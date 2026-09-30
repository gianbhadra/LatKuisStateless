// ==========================================================
// MODEL DATA MAKANAN
// ==========================================================

class FoodItem {
  // Nama makanan
  final String name;

  // Deskripsi makanan
  final String description;

  // URL gambar makanan
  final String imageUrl;

  // Quantity makanan
  int quantity;

  // Harga satuan
  final int price;

  // Constructor
  FoodItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });

  // Menghitung total harga
  int get totalPrice => quantity * price;

  // Format harga satuan
  String get formattedPrice => formatPrice(price);

  // Format total harga
  String get formattedTotal => formatPrice(totalPrice);

  // Data makanan
  static final List<FoodItem> sampleData = [
    FoodItem(
      name: 'Nasi Goreng',
      description: 'Nasi goreng dengan telur dan sayuran.',
      imageUrl:
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b',
      quantity: 0,
      price: 15000,
    ),

    FoodItem(
      name: 'Mie Goreng',
      description: 'Mie goreng dengan sayuran dan telur.',
      imageUrl:
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624',
      quantity: 0,
      price: 12000,
    ),

    FoodItem(
      name: 'Ayam Bakar',
      description: 'Ayam bakar dengan bumbu khas restoran.',
      imageUrl:
          'https://images.unsplash.com/photo-1532550907401-a500c9a57435',
      quantity: 0,
      price: 25000,
    ),

    FoodItem(
      name: 'Es Teh',
      description: 'Minuman teh manis dingin.',
      imageUrl:
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc',
      quantity: 0,
      price: 5000,
    ),

    FoodItem(
      name: 'Es Jeruk',
      description: 'Minuman jeruk segar.',
      imageUrl:
          'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b',
      quantity: 0,
      price: 6000,
    ),
  ];
}


// ==========================================================
// FORMAT HARGA
// ==========================================================

String formatPrice(int value) {
  String number = value.toString();

  List<String> result = [];

  while (number.length > 3) {
    result.insert(
      0,
      number.substring(number.length - 3),
    );

    number = number.substring(
      0,
      number.length - 3,
    );
  }

  result.insert(0, number);

  return result.join('.');
}