import 'package:citizenwallet/models/transaction.dart';
import 'package:citizenwallet/models/wallet.dart';
import 'package:flutter/cupertino.dart';

class WalletState extends ChangeNotifier {
  bool loading = false;
  bool error = false;

  CWWallet? wallet;

  bool transactionsLoading = false;
  bool transactionsError = false;

  List<CWTransaction> transactions = [];

  bool transactionSendLoading = false;
  bool transactionSendError = false;

  void loadWallet() {
    loading = true;
    error = false;
    notifyListeners();
  }

  void loadWalletSuccess(CWWallet wallet) {
    this.wallet = wallet;

    loading = false;
    error = false;
    notifyListeners();
  }

  void loadWalletError() {
    loading = false;
    error = true;
    notifyListeners();
  }

  void updateWalletBalance() {
    loading = true;
    error = false;
    notifyListeners();
  }

  void updateWalletBalanceSuccess(double balance) {
    wallet!.setBalance(balance);

    loading = false;
    error = false;
    notifyListeners();
  }

  void updateWalletBalanceError() {
    loading = false;
    error = true;
    notifyListeners();
  }

  void loadTransactions() {
    transactionsLoading = true;
    transactionsError = false;
    notifyListeners();
  }

  void loadTransactionsSuccess(List<CWTransaction> transactions) {
    this.transactions.clear();
    this.transactions.addAll(transactions);

    transactionsLoading = false;
    transactionsError = false;
    notifyListeners();
  }

  void loadTransactionsError() {
    transactionsLoading = false;
    transactionsError = true;
    notifyListeners();
  }

  void loadAdditionalTransactions() {
    transactionsLoading = true;
    transactionsError = false;
    notifyListeners();
  }

  void loadAdditionalTransactionsSuccess(List<CWTransaction> transactions) {
    this.transactions.addAll(transactions);

    transactionsLoading = false;
    transactionsError = false;
    notifyListeners();
  }

  void loadAdditionalTransactionsError() {
    transactionsLoading = false;
    transactionsError = true;
    notifyListeners();
  }

  void sendTransaction() {
    transactionSendLoading = true;
    transactionSendError = false;
    notifyListeners();
  }

  void sendTransactionSuccess(CWTransaction transaction) {
    transactions.insert(0, transaction);
    transactionSendLoading = false;
    transactionSendError = false;
    notifyListeners();
  }

  void sendTransactionError() {
    transactionSendLoading = false;
    transactionSendError = true;
    notifyListeners();
  }

  void incomingTransactionsRequest() {
    transactionsLoading = true;
    transactionsError = false;
    notifyListeners();
  }

  void incomingTransactionsRequestSuccess(List<CWTransaction> transactions) {
    for (final transaction in transactions) {
      final index = this.transactions.indexWhere((t) => t.id == transaction.id);
      if (index == -1) {
        this.transactions.insert(0, transaction);
      } else {
        this.transactions[index] = transaction;
      }
    }

    transactionsLoading = false;
    transactionsError = false;
    notifyListeners();
  }

  void incomingTransactionsRequestError() {
    transactionsLoading = false;
    transactionsError = true;
    notifyListeners();
  }
}