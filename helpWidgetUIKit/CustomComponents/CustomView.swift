//
//  CustomView.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 04/10/23.
//

import UIKit

class CustomView: UIView {
    static let identifier = "CustomView"

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var value: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: CustomView.identifier, bundle: nil)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
                            UIView else {fatalError("Unable to convert nib")}

        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.addSubview(view)

    }
        
    func configureImageAndText(title : String, iconImage : UIImage, valueDouble: Double){
        mainTitle.text = title
        icon.image = iconImage
        value.text = "R$ " + String(valueDouble)
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 16
        
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero

        mainTitle.textColor = UIColor(named: "fontColor")
        value.textColor = UIColor(named: "fontColor")
        mainTitle.font = UIFont.boldSystemFont(ofSize: mainTitle.font.pointSize)
    }
}
