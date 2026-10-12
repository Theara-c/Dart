class BankAccount {
  // TODO
  int _accountNumber;
  double _balance = 0;
  String _accountName;
  BankAccount({ required this._accountName, required this._accountNumber});
  void credit(double deposit) {
    _balance += deposit;
  }
  double get balance => this._balance;

  void withdraw(double money) {
    try {
      if (_balance < money) {
        throw Exception(
          "You do not have enough money to withdraw. cuz u are broke",
        );
      }
    } catch (e) {
      print("Error $e");
    }
    _balance -= money;
  }
}
class Bank {
  // TODO
  late List<BankAccount> _accounts;
  String name;
  Bank({required this.name}) {
    this._accounts = [];
  }
   createAccount(int accountNum, String accountName) {
    try{
      for (BankAccount account in _accounts) {
        if ( account._accountNumber == accountNum){
          throw Exception("This account is already exist with ID $accountNum");
        }
      }
    } catch (e) {
      print(e);
    }

    BankAccount newAccount = BankAccount(accountNumber: accountNum, accountName:  accountName);
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
