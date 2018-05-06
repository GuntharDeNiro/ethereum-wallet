//
//  SendSettingsSendSettingsInteractorOutput.swift
//  ethereum-wallet
//
//  Created by Artur Guseynov on 02/05/2018.
//  Copyright © 2018 Artur Guseinov. All rights reserved.
//

import Foundation


protocol SendSettingsInteractorOutput: class {
  func didReceiveWallet(_ wallet: Wallet)
}
