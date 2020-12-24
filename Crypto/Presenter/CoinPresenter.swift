//
//  Presenter.swift
//  Crypto
//
//  Created by Raiymbek Duldyiev on 17.04.2022.
//

import UIKit
import Alamofire

typealias PresenterDelegate = CoinPresenterDelegate & UIViewController

protocol CoinPresenterDelegate: AnyObject {
    func presentCoins(coins: [Data