class BankAccount {
    // TODO
    final int accountID;
    final String accountName;
     double currentBalance;
    BankAccount(this.accountID,this.accountName,this.currentBalance);

double balance(){
  return currentBalance;
}
void withdraw(double amount) {
    if (currentBalance - amount >= 0) {
      currentBalance -= amount;
    } else {
      throw Exception(" ${amount} Unable to withdraw!");
    }
  }
double credit(double amount){
 return currentBalance +=amount;
}
}

class Bank {
    // TODO
    final String name;
    final List<BankAccount> accounts=[];
Bank({required this.name});

BankAccount createAccount(int accountId, String accountOwner){
  //If the accountID exist 
  for(var account in accounts){
    if(account.accountID == accountId){
      throw Exception("This account ID is already exists!"); // Throw exception
      }
    }

    // Does not exist, create a new BankAccount
    var newAccount = BankAccount(accountId, accountOwner,  0.0); // Add account type and initial balance
    accounts.add(newAccount);
    return newAccount;
  
}
}
void main() {

   Bank myBank = Bank(name: "CADT Bank");
   BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

   print(ronanAccount.balance()); // Balance: $0
   ronanAccount.credit(100);
   print(ronanAccount.balance()); // Balance: $100
   ronanAccount.withdraw(50);
   print(ronanAccount.balance()); // Balance: $50

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
