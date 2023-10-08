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
    
    func extractAndConvertToDouble(_ inputString: String) -> Double {
        // Separa a string por "," e junta as string
        let cleanedString = inputString.components(separatedBy: ",").joined()
        
        // remove o "R$ ", separando por " "
        let components = cleanedString.components(separatedBy: " ")
        
        // se o componets.count for menor que 1 significa que a string inicial foi escrita errada.
        guard components.count > 1 else {
            return 0
        }
        
        // pega a componente 1 pq é o valor, a componente 0 é "R$"
        let secondValueString = components[1]
        
        // Remova a vírgula e converta o valor em Double
        if let secondValue = Double(secondValueString) {
            return secondValue
        } else {
            return 0
        }
    }
    
    
    func moveDigits(textValue: String) -> String {
        
        let valueDouble = extractAndConvertToDouble(textValue)
        
        let secondValue = String(valueDouble).split(separator: ".")[1].count > 2 ? true : false
        
        if secondValue {
            let finalValue = valueDouble * 10
            return ("R$ " + finalValue.formatToFixedDecimalPlaces(2))
        } else {
            let finalValue = valueDouble / 10
            return ("R$ " + finalValue.formatToFixedDecimalPlaces(2))
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
