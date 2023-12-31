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

//        view.layer.shadowOpacity = shadowOpacityProject
//        view.layer.shadowRadius = shadowRadiusProject
//        if let color = UIColor(named: "shadowColor")?.cgColor {
//            view.layer.shadowColor = color
//        }
//        view.layer.shadowOffset = CGSize.zero
        
        
        self.addSubview(view)
    }
        
    func configureImageAndText(infos: InfosDashBoard) {
        
        mainTitle.text = infos.title
        mainTitle.textColor = UIColor(named: "fontColor")
        mainTitle.font = UIFont.boldSystemFont(ofSize: mainTitle.font.pointSize)
        
        if infos.modeIcon != nil && infos.modeIcon != ModeIcon.basic {
            if let value = infos.percentValue  {
                
                if value != 0 {
                    switch infos.modeIcon {
                    case .percent:
                        if value > 0 {
                            icon.image = UIImage(systemName: "arrow.up")
                            icon.tintColor = UIColor.systemGreen
                        } else {
                            icon.image = UIImage(systemName: "arrow.down")
                            icon.tintColor = UIColor.systemRed
                        }
                    case .percentInv:
                        if value > 0 {
                            icon.image = UIImage(systemName: "arrow.up")
                            icon.tintColor = UIColor.systemRed
                        } else {
                            icon.image = UIImage(systemName: "arrow.down")
                            icon.tintColor = UIColor.systemGreen
                        }
                    case .basic:
                        break
                    case .none:
                        break
                    }
                } else {
                    icon.image = UIImage(systemName: "arrow.up.arrow.down")
                    icon.tintColor = UIColor.secondaryLabel
                }
            }
        } else {
            if let iconPack = infos.iconImage {
                icon.image = UIImage(named: iconPack)
            } else {
                icon.image = .remove
            }
        }
        
        if infos.subtitleString != nil {
            subtitleNote.text = infos.subtitleString
        } else {
            subtitleNote.isHidden = true
        }
        
        if infos.unit != nil {
            unitLabel.text = infos.unit
        } else {
            unitLabel.isHidden = true
        }
        
        value.text = "R$ " + infos.valueDouble.formatToFixedDecimalPlaces(2)
        value.textColor = UIColor(named: "fontColor")

        backgroundRounded.clipsToBounds = true
        backgroundRounded.layer.cornerRadius = cornerRadiusProject
    }
}

