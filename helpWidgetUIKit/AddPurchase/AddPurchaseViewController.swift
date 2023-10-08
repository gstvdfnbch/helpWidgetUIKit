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
        let decimalDivider = ","
        let milDivider = "."
        let spacer = " "
        
        
        var finalString: String = textValue
        
        let textValueCopy = textValue
        
        let stringValue = textValueCopy.split(separator: spacer)[1]
        
        let stringRemoveDot = stringValue.replacingOccurrences(of: milDivider, with: "")
        
        let stringValueDouble = stringRemoveDot.replacingOccurrences(of: decimalDivider, with: milDivider)
        
        if let doubleValue = Double(stringValueDouble) {
                        
            let numberDecimal = String(doubleValue).split(separator: milDivider)[1].count
            
            if numberDecimal > 2 {
                finalString = "R$ " + Double(doubleValue * 10).formatToFixedDecimalPlaces(2)
            } else {
                finalString = "R$ " + Double(doubleValue / 10).formatToFixedDecimalPlaces(2)
            }
        }
        
        return finalString
            
        
    }
    
    @IBAction func changeValue(_ sender: Any) {
        guard let textValue = textFieldValue.text else { return }
        
        textFieldValue.text = moveDigits(textValue: textValue)
    }

    @IBAction func savePurchase(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
