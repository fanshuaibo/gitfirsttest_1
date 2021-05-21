
//
//  ListViewController.swift
//  Crypto
//
//  Created by Raiymbek Duldyiev on 17.04.2022.
//

import UIKit
import Firebase

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var suggestionMessage: UILabel!
    
    private let presenter = CoinPresenter()
    private var coins = [Data]()
    private var selectedCoin = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CoinCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        presenter.setViewDelegate(delegate: self)
        presenter.performRequest()
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        presenter.performRequest()
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoreDetails" {
            let destinationVC = segue.destination as! CoinViewController
            destinationVC.coin = selectedCoin
        }
    }
    
}

// MARK: CoinPresenterDelegate

extension ListViewController: CoinPresenterDelegate {
    
    func presentCoins(coins: [Data]) {
        self.coins = coins
        
        DispatchQueue.main.async {
            self.suggestionMessage.isHidden = true
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        
        var message = error.localizedDescription.debugDescription
        message.removeLast()
        message = String(message.reversed())
        message.removeLast()
        message = String(message.reversed())
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)