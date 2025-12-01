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
  double get balance => balance;
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
