//
//  TitleSubdivisionComponent.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 04/10/23.
//

import UIKit

class TitleSubdivisionComponent: UIView {
    static let identifier = "TitleSubdivisionComponent"

    @IBOutlet weak var titleMonth: UILabel!
    @IBOutlet weak var titlePeriod: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {

        let nib = UINib(nibName: TitleSubdivisionComponent.identifier, bundle: nil)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
                            UIView else {fatalError("Unable to convert nib")}

        view.frame = self.bounds
        
        self.addSubview(view)
    }
    
    func sendData(titleMnt: String, subtitleMnt: String) {
        titleMonth.text = titleMnt
        titlePeriod.text = subtitleMnt
    }

}
