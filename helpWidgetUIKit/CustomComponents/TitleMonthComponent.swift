//
//  TitleSubdivisionComponent.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 04/10/23.
//

import UIKit

class TitleMonthComponent: UIView {
    static let identifier = "TitleMonthComponent"

    @IBOutlet weak var titleMonth: UILabel!
    @IBOutlet weak var titlePeriod: UILabel!
    
    @IBOutlet weak var chevronRight: UIImageView!
    @IBOutlet weak var chevronLeft: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {

        let nib = UINib(nibName: TitleMonthComponent.identifier, bundle: nil)

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


