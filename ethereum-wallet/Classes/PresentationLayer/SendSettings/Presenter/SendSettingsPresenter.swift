//
//  SendSettingsSendSettingsPresenter.swift
//  ethereum-wallet
//
//  Created by Artur Guseynov on 02/05/2018.
//  Copyright © 2018 Artur Guseinov. All rights reserved.
//

import UIKit


class SendSettingsPresenter {
    
  weak var view: SendSettingsViewInput!
  weak var output: SendSettingsModuleOutput?
  var interactor: SendSettingsInteractorInput!
  var router: SendSettingsRouterInput!
  
  private var settings: SendSettings!
  private var coin: CoinDisplayable!
  private var localCurrency: String!
    
  private func calculateFee() {
    let amount = Ether(weiValue: settings.gasLimit * settings.gasPrice)
    let fiatString = coin.fiatString(amount: amount, iso: localCurrency)
    view.setFeeAmount(amount.amountString, fiatAmount: fiatString)
  }
    
}


// MARK: - SendSettingsViewOutput

extension SendSettingsPresenter: SendSettingsViewOutput {

  func viewIsReady() {
    view.setupInitialState(settings: settings, coin: coin)
    interactor.getWallet()
  }
  
  func gasPriceDidChanged(_ gasPrice: Int) {
    settings.gasPrice = Decimal(gasPrice)
    calculateFee()
  }
  
  func gasLimitDidChanged(_ gasLimit: Int) {
    settings.gasLimit = Decimal(gasLimit)
    calculateFee()
  }
  
  func txDataDidChanged(_ txData: Data) {
    settings.txData = txData
  }
  
  func saveDidPressed() {
    output?.didSelect(settings: settings)
    view.dissmiss()
  }

}


// MARK: - SendSettingsInteractorOutput

extension SendSettingsPresenter: SendSettingsInteractorOutput {
  
  func didReceiveWallet(_ wallet: Wallet) {
    self.localCurrency = wallet.localCurrency
    calculateFee()
  }

}


// MARK: - SendSettingsModuleInput

extension SendSettingsPresenter: SendSettingsModuleInput {
  
  func present(from viewController: UIViewController, settings: SendSettings, coin: CoinDisplayable, output: SendSettingsModuleOutput?) {
    self.settings = settings
    self.output = output
    self.coin = coin
    view.present(fromViewController: viewController)
  }

}
