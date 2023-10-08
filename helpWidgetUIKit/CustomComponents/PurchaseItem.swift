//
//  PurchaseItem.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 07/10/23.
//

import UIKit

class PurchaseItem: UIView {
    static let identifier = "PurchaseItem"

    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var categoryBox: UIView!
    @IBOutlet weak var valueText: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {

//        let nib = UINib(nibName: PurchaseItem.identifier, bundle: nil)
        let nib = UINib(nibName: "PurchaseItem", bundle: nil)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
                            UIView else {fatalError("Unable to convert nib")}

        view.frame = self.bounds

//        self.categoryBox.layer.cornerRadius = 8
//        self.categoryBox.layer.shadowOpacity = shadowOpacityProject
//        self.categoryBox.layer.shadowRadius = shadowRadiusProject
//        if let color = UIColor(named: "shadowColor")?.cgColor {
//            self.categoryBox.layer.shadowColor = color
//        }
//        self.categoryBox.layer.shadowOffset = CGSize.zero
        self.categoryBox.isHidden = true
        
        self.addSubview(view)
    }
    
    func configureContent(date: Date, category: String, value: Double) {
        //print("entrou")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        self.dateText.text = dateFormatter.string(from: date)
        self.valueText.text = value.formatToFixedDecimalPlaces(2)
        
    }
      

}
