//
//  TitleSectionComponenteTableViewCell.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 08/10/23.
//

import UIKit

class TitleSectionCell: UITableViewCell {
    static let identifier = TitleSectionComponent.identifier
        
    @IBOutlet weak var titleMain: TitleSectionComponent!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func sendTextTitle(title: String) {
        titleMain.titleText.text = title
    }

}
