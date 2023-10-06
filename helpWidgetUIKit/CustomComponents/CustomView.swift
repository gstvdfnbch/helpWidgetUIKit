//
//  CustomView.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 04/10/23.
//

import UIKit

class CustomView: UIView {
    static let identifier = "CustomView"
    
    let containerView = UIView()
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var backgroundRounded: UIView!
    @IBOutlet weak var subtitleNote: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
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

        view.layer.shadowOpacity = 0.50
        view.layer.shadowRadius = shadowRadiusProject
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize.zero
        
        
        self.addSubview(view)
    }
        
    func configureImageAndText(title : String, 
                               iconImage : String? = nil,
                               modeIcon: ModeIcon? = nil,
                               valueDouble: Double,
                               percentValue: Double? = nil,
                               unit: String? = nil,
                               subtitleString: String? = nil){
        
        mainTitle.text = title
        mainTitle.textColor = UIColor(named: "fontColor")
        mainTitle.font = UIFont.boldSystemFont(ofSize: mainTitle.font.pointSize)
        
        
        if modeIcon != nil && modeIcon != ModeIcon.basic {
            if let value = percentValue {
                
                switch modeIcon {
                case .percent:
                    if value > 0 {
                        icon.image = UIImage(systemName: "arrow.up")
                        icon.tintColor = UIColor.green
                    } else {
                        icon.image = UIImage(systemName: "arrow.down")
                        icon.tintColor = UIColor.red
                    }
                    case .percentInv:
                    if value > 0 {
                        icon.image = UIImage(systemName: "arrow.up")
                        icon.tintColor = UIColor.red
                    } else {
                        icon.image = UIImage(systemName: "arrow.down")
                        icon.tintColor = UIColor.green
                    }
                    case .basic:
                        break
                    case .none:
                        break
                    }
                }
        } else {
            //if let iconPack = UIImage(named: iconImage) {
            if let iconPack = iconImage {
                icon.image = UIImage(named: iconPack)
                icon.tintColor = UIColor.purple
            } else {
                icon.image = .remove
            }
        }
        
        if subtitleString != nil {
            subtitleNote.text = subtitleString
        } else {
            subtitleNote.isHidden = true
        }
        
        if unit != nil {
            unitLabel.text = unit
        } else {
            unitLabel.isHidden = true
        }
        
        value.text = "R$ " + String(valueDouble)
        value.textColor = UIColor(named: "fontColor")

        backgroundRounded.clipsToBounds = true
        backgroundRounded.layer.cornerRadius = cornerRadiusProject

    }
}

