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
        
        guard let startImage = UIImage(named: "start") else { return }
        guard let walletImage = UIImage(named: "wallet") else { return }
        guard let targetImage = UIImage(named: "target") else { return }
        guard let expensesImage = UIImage(named: "expenses") else { return }
        
        
        startBalance.configureImageAndText(title: "Start Balance", iconImage: startImage, valueDouble: 743.0)
        actualBalance.configureImageAndText(title: "Actual Balance", iconImage: walletImage, valueDouble: 240.03)
        averageGoal.configureImageAndText(title: "Average Goal", iconImage: targetImage, valueDouble: 24.74)
        spentSoFar.configureImageAndText(title: "Spent So Far", iconImage: expensesImage, valueDouble: -212.39)
    }


}

