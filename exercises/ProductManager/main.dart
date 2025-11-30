class Product {
  String name;
  double price;
  String? description;
  int _stock;

  Product(this.name, this.price, [this.description]) : _stock = 0;
  Product.empty() : name = 'Unknown', price = 0, description = null, _stock = 0;
  bool get inStock => _stock > 0;
  String get fullInfo {
    final desc = description ?? 'No description';
    return 'Product (name : $name, price : $price, description : $desc, stock: $_stock)';
  }

  int get stock => _stock;
  set stock(int value) {
    if (value < 0) {
      _stock = 0;
    } else {
      _stock = value;
    }
  }
}

class DigitalProduct extends Product {
  double _fileSize;
  double get fileSize => _fileSize;
  set fileSize(double value) {
    if (value < 0) {
      _fileSize = 0;
    } else {
      _fileSize = value;
    }
  }

  DigitalProduct({
    required String name,
    required double price,
    String? description,
    required double fileSize,
  }) : _fileSize = fileSize < 0 ? 0 : fileSize,
       super(name, price, description);
  @override
  String get fullInfo {
    final desc = description ?? 'No description';
    return 'DigitalProduct(name : $name, price : $price, description : $desc, stock : $stock, fileSize : $_fileSize MB)';
  }
}

class Productmanager {
  final List<Product> _product = [];
  void addProduct(Product p) {
    _product.add(p);
  }

  void removeProduct(String name) {
    _product.removeWhere((p) => p.name == name);
  }

  Product? find(String name) {
    try {
      return _product.firstWhere((p) => p.name == name);
    } catch (_) {
      return null;
    }
  }

  List<Product> get all => List.unmodifiable(_product);
  double totalvalue() {
    double sum = 0;
    for (var p in _product) {
      sum += p.price * p.stock;
    }
    return sum;
  }
}

void main() {
  var p1 = Product("iPhone", 999, "Apple smart phone");
  p1.stock = 10;
  print(p1);

  var p2 = Product("MacBook", 1999);
  p2.stock = -5;
  var p3 = Product.empty();
  p3.stock = 2;
  var ebook = DigitalProduct(
    name: "Flutter Ebook",
    price: 20,
    description: "Learn Flutter from scratch",
    fileSize: 5,
  );
  ebook.stock = 100;
  var manager = Productmanager();
  manager.addProduct(p1);
  manager.addProduct(p2);
  manager.addProduct(p3);
  manager.addProduct(ebook);
  // print toan bo san pham
  print('--- ALL PRODUCTS ---');
  for (var p in manager.all) {
    print(p.fullInfo);
  }
  print('\n--- TOTAL VALUE ---');
  print('Total Value : ${manager.totalvalue()}');
  print('\n--- FIND IPHONE');
  var found = manager.find("iPhone");
  if (found != null) {
    print('Found : ${found.fullInfo}');
  } else {
    print('Product "iphone" not found');
  }
  // 7. Thử find sản phẩm không tồn tại
  print('\n--- FIND "NonExist" ---');
  var notFound = manager.find("NonExist");
  if (notFound != null) {
    print('Found: ${notFound.fullInfo}');
  } else {
    print('Product "NonExist" not found'); // nhánh này sẽ chạy
  }

  // 8. Xoá 1 product và in lại danh sách
  print('\n--- REMOVE "MacBook" ---');
  manager.removeProduct("MacBook");

  print('\n--- ALL PRODUCTS AFTER REMOVE ---');
  for (var p in manager.all) {
    print(p.fullInfo);
  }
}
