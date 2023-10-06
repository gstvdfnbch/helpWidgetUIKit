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
    static let identifier = CustomView.identifier
    
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

class TitleSectionCell: UITableViewCell {
    static let identifier = TitleSectionComponent.identifier
    
    
    @IBOutlet weak var titleSection: TitleSectionComponent!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
