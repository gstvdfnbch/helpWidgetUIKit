//
//  Dashboard.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 07/10/23.
//

import Foundation

let dashboarCount: Int = 8

struct Dashboard{

    var componentsListValues: [(Double, Double)] = Array(repeating: (0.0, 0.0), count: dashboarCount)
    
    var componentsList: [InfosDashBoard] = [
        InfosDashBoard(title: "Start Balance", typeComp: DashboardItem.startBalance, iconImage: "start", valueDouble: 0.0),
        InfosDashBoard(title: "Actual Balance", typeComp: DashboardItem.actualBalance, iconImage: "wallet", valueDouble: 0.0),
        InfosDashBoard(title: "Average\nGoal", typeComp: DashboardItem.averageGoal, iconImage: "target", valueDouble: 0.0, unit: " / day", subtitleString: "This is THE right way! :)"),
        InfosDashBoard(title: "Spent\nSo Far", typeComp: DashboardItem.spentSoFar, iconImage: "expenses", valueDouble: 0.0, subtitleString: "Remeber to save money."),
        
        InfosDashBoard(title: "Average\nSpent", typeComp: DashboardItem.averageSpent, modeIcon: ModeIcon.percentInv, valueDouble: 0.0, percentValue: 0.0, unit: " / day", subtitleString: "Average daily spending you have done so far."),
        InfosDashBoard(title: "Average \nLeft Over", typeComp: DashboardItem.averageLeftOver, modeIcon: ModeIcon.percent, valueDouble: 0.0, percentValue: 0.0, unit: " / day", subtitleString: "Average daily spending limit, but you won't."),
        
        InfosDashBoard(title: "Today", typeComp: DashboardItem.today, modeIcon: ModeIcon.percentInv, valueDouble: 0.0, percentValue: 0.0, subtitleString: "How much you spent today."),
        InfosDashBoard(title: "Yesterday", typeComp: DashboardItem.yesterday, modeIcon: ModeIcon.percentInv, valueDouble: 0.0, percentValue: 0.0, subtitleString: "How much you spent yesterday.")
    ]
    
    let dashBoardList: [TableViewDashBoard] = [
        TableViewDashBoard(title: "May 2023",
                           itens: []),
        TableViewDashBoard(title: "General Infos",
                           itens: [
                            DashboardItem.startBalance,
                            DashboardItem.actualBalance,
                            DashboardItem.averageGoal,
                            DashboardItem.spentSoFar]
                          ),
        TableViewDashBoard(title: "Chart Expenses",
                           itens: []),
        TableViewDashBoard(title: "Expenses Review",
                           itens: [
                            DashboardItem.averageSpent,
                            DashboardItem.averageLeftOver,
                            DashboardItem.today,
                            DashboardItem.yesterday]
                          )
    ]
    
    func infosDashBoard (index: Int) -> InfosDashBoard {
        return componentsList[index]
    }
    
    mutating func updateValuesDashboard() {
        for item in 0..<componentsListValues.count {
            componentsList[item].valueDouble = componentsListValues[item].0
            componentsList[item].percentValue = componentsListValues[item].1
        }
    }
}
