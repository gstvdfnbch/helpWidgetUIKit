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
        
        titleMonthComponent.sendData(
            titleMnt: "October :p",
            subtitleMnt: "06 - 12 October 2023")
        
        
        startBalance.configureImageAndText(infos:dashBoardList[DashboardItem.startBalance.rawValue])
        
        actualBalance.configureImageAndText(infos: dashBoardList[DashboardItem.actualBalance.rawValue])
        
        averageGoal.configureImageAndText(infos: dashBoardList[DashboardItem.averageGoal.rawValue])
        
        spentSoFar.configureImageAndText(infos: dashBoardList[DashboardItem.spentSoFar.rawValue])
        
        averageLeftOver.configureImageAndText(infos: dashBoardList[DashboardItem.averageSpent.rawValue])
        
        averageSpent.configureImageAndText(infos: dashBoardList[DashboardItem.averageLeftOver.rawValue])
        
        today.configureImageAndText(infos: dashBoardList[DashboardItem.today.rawValue])
        
        yesterday.configureImageAndText(infos: dashBoardList[DashboardItem.yesterday.rawValue])
        
        
    }
    
    
}

