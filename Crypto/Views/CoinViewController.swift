//
//  CryptoViewController.swift
//  Crypto
//
//  Created by Raiymbek Duldyiev on 17.04.2022.
//

import UIKit

var t = 1000000000000.00
var b = 1000000000.00
var m = 1000000.00
var k = 1000.00

class CoinViewController: UIViewController {

    @IBOutlet weak var priceValue: UILabel!
    @IBOutlet weak var marketCapValue: UILabel!
    @IBOutlet weak var vwapValue: UILabel!
    @IBOutlet weak var supplyValue: UILabel!
    @IBOutlet weak var volumeValue: UILabel!
    @IBOutlet weak var changeValue: UILabel!
    
    @IBOutlet weak var copiedDisplay: UIView!
    
    var coin = Data()
    
    override func viewDidLoad() {