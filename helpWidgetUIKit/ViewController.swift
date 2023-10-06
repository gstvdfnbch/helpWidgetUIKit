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
        
        
        startBalance.configureImageAndText(
            title: "Start Balance",
            iconImage: "start",
            valueDouble: 743.0)
        
        actualBalance.configureImageAndText(
            title: "Actual Balance",
            iconImage: "wallet",
            valueDouble: 240.03)
        
        
        averageGoal.configureImageAndText(
            title: "Average Goal", 
            iconImage: "target", 
            valueDouble: 24.74, 
            subtitleString: "This is THE right way! :)")
        
        spentSoFar.configureImageAndText(
            title: "Spent So Far", 
            iconImage: "expenses", 
            valueDouble: -212.39, 
            subtitleString: "Remeber to save money.")
        
        
        averageLeftOver.configureImageAndText(
            title: "Average Spent",
            modeIcon: ModeIcon.percentInv,
            valueDouble: 29.48,
            percentValue: 0.5,
            unit: "/ day",
            subtitleString: "Average daily spending you have done so far.")
        
        averageSpent.configureImageAndText(
            title: "Average Left Over",
            modeIcon: ModeIcon.percent,
            valueDouble: 24.39,
            percentValue: -0.5,
            unit: "/ day",
            subtitleString: "Average daily spending limit, but you won't.")
        
        today.configureImageAndText(
            title: "Today",
            modeIcon: ModeIcon.percentInv,
            valueDouble: 19.48,
            percentValue: -0.5,
            subtitleString: "How much you spent today.")
        
        yesterday.configureImageAndText(
            title: "Yesterday",
            modeIcon: ModeIcon.percentInv,
            valueDouble: 23.39,
            percentValue: 0.5,
            subtitleString: "How much you spent yesterday.")
        
       
    }


}

