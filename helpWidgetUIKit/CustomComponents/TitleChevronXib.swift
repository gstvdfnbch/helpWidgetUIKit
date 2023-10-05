//
//  TitleChevronXib.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 04/10/23.
//

import UIKit

class TitleChevronXib: UIView {
    static let identifier = "TitleChevronXib"
    
    @IBOutlet weak var monthTitle: UILabel!
    @IBOutlet weak var fullDateText: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: TitleChevronXib.identifier, bundle: nil)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
                            UIView else {fatalError("Unable to convert nib")}

        view.frame = self.bounds
        //view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.addSubview(view)

    }
    
    func configureImageAndText(title : String, fulldate : String){
        
        monthTitle.text = title
        fullDateText.text = fulldate
        
        monthTitle.font = UIFont.boldSystemFont(ofSize: monthTitle.font.pointSize)
    }
}
