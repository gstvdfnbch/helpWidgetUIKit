//
//  TitleSectionPurchaseListCell.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 08/10/23.
//

import UIKit

class TitleSectionPurchaseListTableViewCell: UITableViewCell {
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
        let fontDescriptorTitle3 = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title2)
        let fontTitle2 = UIFont(descriptor: fontDescriptorTitle3, size: 0) // O tamanho 0 indica o tamanho padrão

        titleMain.titleText.font = fontTitle2
        titleMain.titleText.text = title
    }

}
