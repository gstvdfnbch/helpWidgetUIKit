//
//  DoubleColumnTableViewCell.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 08/10/23.
//

import UIKit

class DoubleColumn: UITableViewCell {
    static let identifier = "DoubleColumn"
    
    @IBOutlet weak var leftComponent: CustomView!
    @IBOutlet weak var rightComponent: CustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
