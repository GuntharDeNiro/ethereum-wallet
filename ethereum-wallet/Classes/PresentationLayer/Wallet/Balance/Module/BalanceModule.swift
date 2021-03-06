// Copyright © 2018 Conicoin LLC. All rights reserved.
// Created by Artur Guseinov


import UIKit


class BalanceModule {
    
  class func create(app: Application) -> BalanceModuleInput {
    let router = BalanceRouter()
    let presenter = BalancePresenter()
    let interactor = BalanceInteractor()
    let viewController = R.storyboard.balance.balanceViewController()!

    interactor.output = presenter

    viewController.output = presenter

    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    router.app = app
    
    // MARK: - Injection

    interactor.walletRepository = app.walletRepository
    interactor.balanceUpdater = app.balanceUpdater
    interactor.ratesUpdater = app.ratesUpdater
    interactor.balanceIndexer = app.balanceIndexer
    interactor.tokenIndexer = app.tokenIndexer
        
    return presenter
  }
    
}
