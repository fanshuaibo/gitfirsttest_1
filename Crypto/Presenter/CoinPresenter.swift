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
    func presentCoins(coins: [Data])
    
    func didFailWithError(error: Error)
}

class CoinPresenter {
    
    weak var delegate: PresenterDelegate?
    
    private let urlString = "https://api.coincap.io/v2/assets"
    
    func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    func performRequest() {
        AF.request(urlString, parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { [weak self] AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) els