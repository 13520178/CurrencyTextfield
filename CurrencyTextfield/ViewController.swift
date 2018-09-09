//
//  ViewController.swift
//  CurrencyTextfield
//
//  Created by Phan Nhat Dang on 9/9/18.
//  Copyright © 2018 Phan Nhat Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    var amt:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.placeholder = updateToCurrency()
        
        let money:Double = 123456789
        let moneyString = updateToCurrencyResult(number: money)
        print(moneyString!)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if let digit = Int(string) {
            amt = amt * 10 + digit
            textField.text = updateToCurrency()
        }
        if string == "" {
            amt = amt/10
            textField.text = updateToCurrency()
        }
        
        return false
    }
    
    func updateToCurrency() ->String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        let amount = Double(amt) 
        return formatter.string(from: NSNumber(value: amount))

    }
    
    func updateToCurrencyResult(number:Double) ->String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        return formatter.string(from: NSNumber(value: number))
        
    }
  
}

