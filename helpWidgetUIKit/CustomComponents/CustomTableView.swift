//
//  CustomTableView.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 06/10/23.
//

import UIKit

class TitleMonthComponentTableViewCell: UITableViewCell {

    @IBOutlet weak var titleMonthComponentView: TitleMonthComponent!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class DoubleColumn: UITableViewCell {
    static let identifier = "DoubleColumn"
    
    @IBOutlet weak var actualBalance: CustomView!
    @IBOutlet weak var startBalance: CustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
