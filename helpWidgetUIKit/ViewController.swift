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
    @IBOutlet weak var averageGoal: CustomView!
    @IBOutlet weak var spentSoFar: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startBalance.configureImageAndText(title: "Start Balance", iconImage: UIImage(named: "start") ?? UIImage(), valueDouble: 743.0)
        
        actualBalance.configureImageAndText(title: "Actual Balance", iconImage:  UIImage(named: "wallet") ?? UIImage(), valueDouble: 482.32)
        
        averageGoal.configureImageAndText(title: "Average Goal", iconImage:  UIImage(named: "target") ?? UIImage(), valueDouble: 22.58)

        spentSoFar.configureImageAndText(title: "Spent So Far", iconImage:  UIImage(named: "expenses") ?? UIImage(), valueDouble: -217.37)

        
    }


}

