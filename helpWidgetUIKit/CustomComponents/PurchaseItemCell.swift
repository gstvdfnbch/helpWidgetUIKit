//
//  CustomTableView.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 06/10/23.
//

import UIKit


class PurchaseItemCell: UITableViewCell {
    static let identifier = PurchaseItem.identifier
    
    
    @IBOutlet weak var purchaseItem: PurchaseItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func sendInfos(_ infos: Purchase) {
        self.purchaseItem.dateText.text = infos.dayString()
        self.purchaseItem.categoryBox.backgroundColor = UIColor(named: "backgroundComponents")
        self.purchaseItem.valueText.text = "R$ " + infos.amount.formatToFixedDecimalPlaces(2)
    }

}
