//
//  TitleSectionComponent.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 06/10/23.
//

import UIKit

class TitleSectionComponent: UIView {
    static let identifier = "TitleSectionComponent"

    @IBOutlet weak var titleText: UILabel!
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {

        let nib = UINib(nibName: TitleSectionComponent.identifier, bundle: nil)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
                            UIView else {fatalError("Unable to convert nib")}

        view.frame = self.bounds
        
        self.addSubview(view)
    }
    
    func configureImageAndText(infos: InfosDashBoard) {
        titleText.text = infos.title
    }


}
