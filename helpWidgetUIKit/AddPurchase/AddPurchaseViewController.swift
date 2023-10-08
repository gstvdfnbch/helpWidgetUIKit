//
//  AddPurchaseViewController.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 07/10/23.
//

import UIKit

class AddPurchaseViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textFieldValue: UITextField!
    @IBOutlet weak var buttonSend: UIButton!
    
    @IBOutlet weak var shadowButton: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sheetPresentationController?.preferredCornerRadius = cornerRadiusProject
        
        
        titleLabel.font =
        UIFont.boldSystemFont(ofSize: titleLabel.font.pointSize)
        
        textFieldValue.becomeFirstResponder()
        
        buttonSend.isEnabled = true
        buttonSend.clipsToBounds = false
    }
    

    func moveDigits(textValue: String) -> String {
        let valueString = textValue.split(separator: " ")
        if let value = Double(valueString[1]) {
            let finalValue = value * 10
            return ("R$ " + finalValue.formatToFixedDecimalPlaces(2))
        } else {
            return textValue
        }
    }
    
    @IBAction func changeValue(_ sender: Any) {
        guard let textValue = textFieldValue.text else { return }
        
        textFieldValue.text = moveDigits(textValue: textValue)
    }
    

    
    @IBAction func buttonTapped(_ sender: Any) {
        if let text = textFieldValue.text {
           print(text)
        }
    }
}
