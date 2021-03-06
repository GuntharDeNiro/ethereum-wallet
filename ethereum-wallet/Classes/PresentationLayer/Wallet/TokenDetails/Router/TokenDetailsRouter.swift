// Copyright © 2018 Conicoin LLC. All rights reserved.
// Created by Artur Guseinov


import UIKit


class TokenDetailsRouter {
  var app: Application!
}


// MARK: - TokenDetailsRouterInput

extension TokenDetailsRouter: TokenDetailsRouterInput {
  
  func presentSend(for viewModel: TokenViewModel, from: UIViewController) {
    let type = CoinType.token(viewModel.token)
    SendModule.create(app: app, type: type).presentSend(from: from)
  }
  
  func presentDetails(with transaction: TransactionDisplayer, from: UIViewController) {
    TransactionDetailsModule.create(app: app, isToken: transaction.isTokenTransfer).present(with: transaction, from: from)
  }
    
}
