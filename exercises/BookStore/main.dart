class Book {
  String id;
  String title;
  String author;
  double _price;
  set price(double value) {
    if (value < 0) {
      _price = 0;
    } else {
      _price = value;
    }
  }

  double get price => _price;
  Book(this.id, this.title, this.author, double price) : _price = 0 {
    this.price = price;
  }
  Book.free(this.title, this.author) : id = "FREE", _price = 0;
  bool get isFree => price == 0;
}

class Customer {
  String name;
  double _balance;
  Customer(this.name, double balance) : _balance = balance < 0 ? 0 : balance;
  double get balance => _balance;
  void deposit(double amount) {
    if (amount < 0) {
      print("Deposit amount must be > 0");
      return;
    }
    _balance += amount;
  }

  bool buy(Book book) {
    if (book.price > _balance) {
      print("Not enough balance to buy ${book.title}");
      return false;
    }
    _balance -= book.price;
    print("Bought: ${book.title}");
    return true;
  }
}

class BookStore {
  String name;
  final List<Book> _inventory = [];
  Map<String, double> revenueByAuthor = {};
  double _totalRevenue = 0;
  BookStore(this.name);
  int get totalBook => _inventory.length;
  double get totalRevenue => _totalRevenue;
  void addBook(Book b) {
    _inventory.add(b);
  }

  void removeBook(String id) {
    _inventory.removeWhere((b) => b.id == id);
  }

  Book? searchByTitle(String keyword) {
    try {
      return _inventory.firstWhere((b) => b.title == keyword);
    } catch (_) {
      return null;
    }
  }

  void sellBook(String id, Customer customer) {
    final index = _inventory.indexWhere((b) => b.id == id);
    if (index == -1) {
      print("Book not found");
      return;
    }
    final book = _inventory[index];
    final success = customer.buy(book);
    if (!success) return;
    _inventory.removeAt(index);
    revenueByAuthor[book.author] =
        (revenueByAuthor[book.author] ?? 0) + book.price;
    _totalRevenue += book.price;
    print("Sale recorded for author ${book.author}");
  }
}

void main() {
  // 1. Tạo bookstore
  final store = BookStore("Flutter Books");

  // 2. Tạo một vài cuốn sách
  final book1 = Book("B1", "Dart Mastery", "John", 300000);
  final book2 = Book("B2", "Flutter From Zero", "Mike", 150000);
  final book3 = Book.free("Free Dart Ebook", "Unknown Author");

  // 3. Thêm sách vào inventory
  store.addBook(book1);
  store.addBook(book2);
  store.addBook(book3);

  // In thử inventory ban đầu
  print("");

  // 4. Tạo customer
  final customer = Customer("Dung", 400000);
  print("Customer: ${customer.name}, balance: ${customer.balance}");
  print("");

  // 5. Bán vài cuốn
  store.sellBook("B1", customer); // đủ tiền
  store.sellBook("B2", customer); // có thể thiếu tiền
  store.sellBook("B999", customer); // không tồn tại
  store.sellBook("FREE", customer); // sách free
  print("");

  // 6. In kết quả sau khi mua
  print("Final balance of ${customer.name}: ${customer.balance}");
  print("Total revenue: ${store.totalRevenue}");

  print("Revenue by author:");
  store.revenueByAuthor.forEach((author, revenue) {
    print("  - $author: $revenue");
  });

  print("");
}
