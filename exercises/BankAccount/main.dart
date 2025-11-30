class Bankaccount {
  String _owner;
  double _balance;

  // Constructor
  Bankaccount({required String owner, required double balance})
  : _owner = owner.trim(), _balance = balance {
    if (_owner.isEmpty) {
      throw ArgumentError('owner can not be empty');
    }
    if (_balance < 0) {
      throw ArgumentError('Balance must be positive');
    }
  } // end constructor

  // Getter and Setter
  String get owner => _owner;
  double get balance => _balance;
  set owner (String value){
    if (value.trim().isEmpty) {
      throw ArgumentError('owner can not be empty');
    }
    _owner = value.trim();
  }
  deposit (double amount){
    if (amount < 0 ){
      throw ArgumentError('Deposit amount can not be negative');
    }
    _balance = _balance + amount;
  }
  withdraw (double amount){
    if ((_balance < amount) || (amount <  0)){
      throw ArgumentError('Your withdraw amount is negative or your balance is not enough');

    }
    _balance = _balance - amount;
  }
  @override
  String toString() => 'BankAccount(owner : $_owner, balance : $_balance)';
}
void main() {
  try {
    final acc = Bankaccount(owner: "Dung Pham", balance: 100000);
    print('Init : $acc');
    acc.owner = "Cong";
    print('Test : $acc');
    try {
      acc.withdraw(200000);
      print('Deposit 20000 : $acc');
    } catch(e){
      print('Withdraw excess : $e');
    }
    try {
      acc.deposit(-200);
    } catch(e){
      print('Invalid deposit : $e');
    }
  } catch (e){
        print('Constructor failed -> $e');
  }
}