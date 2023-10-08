//
//  TitleMonthComponentTableView.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 08/10/23.
//

import UIKit

class TitleMonthComponentTableViewCell: UITableViewCell {
    static let identifier = TitleMonthComponent.identifier

    @IBOutlet weak var titleMonthComponentView: TitleMonthComponent!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func sendTextTitle(title: String) {
        titleMonthComponentView.titleMonth.text = title
    }
}
