//
//  ViewController.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 04/10/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleMonthComponent: TitleMonthComponent!
    
    @IBOutlet weak var startBalance: CustomView!
    @IBOutlet weak var actualBalance: CustomView!
    
    @IBOutlet weak var averageGoal: CustomView!
    @IBOutlet weak var spentSoFar: CustomView!
    
    @IBOutlet weak var averageLeftOver: CustomView!
    @IBOutlet weak var averageSpent: CustomView!
    
    @IBOutlet weak var today: CustomView!
    @IBOutlet weak var yesterday: CustomView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    
}

