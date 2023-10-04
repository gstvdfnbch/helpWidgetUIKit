//
//  ViewController.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 04/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startBalance: CustomView!
    @IBOutlet weak var actualBalance: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startBalance.configureImageAndText(title: "Start Balance", iconImage: UIImage.start, valueDouble: 743.0)
        
        actualBalance.configureImageAndText(title: "Actual Balance", iconImage: UIImage.checkmark, valueDouble: 240.03)
    }


}

