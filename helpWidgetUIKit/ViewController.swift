//
//  ViewController.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 04/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleMonthComponent: TitleSubdivisionComponent!
    @IBOutlet weak var startBalance: CustomView!
    @IBOutlet weak var actualBalance: CustomView!
    @IBOutlet weak var averageGoal: CustomView!
    @IBOutlet weak var spentSoFar: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startBalance.configureImageAndText(title: "Start Balance", iconImage: "start", valueDouble: 743.0)
        actualBalance.configureImageAndText(title: "Actual Balance", iconImage: "wallet", valueDouble: 240.03)
        averageGoal.configureImageAndText(title: "Average Goal", iconImage: "target", valueDouble: 24.74, subtitleString: "This is THE right way! :)")
        spentSoFar.configureImageAndText(title: "Spent So Far", iconImage: "expenses", valueDouble: -212.39, subtitleString: "Remeber to save money.")
        
        titleMonthComponent.sendData(titleMnt: "October :p", subtitleMnt: "06 - 12 October 2023")
    }


}

