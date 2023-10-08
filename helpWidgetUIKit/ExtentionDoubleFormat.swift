//
//  ExtentionDoubleFormat.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 07/10/23.
//

import Foundation

extension Double {
    func formatToFixedDecimalPlaces(_ decimalPlaces: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = decimalPlaces
        numberFormatter.maximumFractionDigits = decimalPlaces
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
