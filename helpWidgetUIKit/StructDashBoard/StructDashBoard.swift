//
//  StructDashBoard.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 06/10/23.
//

import UIKit

enum DashboardItem: Int {
    case startBalance = 0
    case actualBalance
    case averageGoal
    case spentSoFar
    case averageLeftOver
    case averageSpent
    case today
    case yesterday
}

struct InfosDashBoard {
    var title: String
    var iconImage: String? = nil
    var modeIcon: ModeIcon? = nil
    var valueDouble: Double
    var percentValue: Double? = nil
    var unit: String? = nil
    var subtitleString: String? = nil
}


struct TableViewDashBoard {
    var title: String
    var subtitle: String? = nil
    var itens: [InfosDashBoard]? = []
}


let dashBoardList: [TableViewDashBoard] = [
    TableViewDashBoard(title: "October",
                       subtitle: "07 - 14 June 2023",
                       itens: [
                        componentsList[DashboardItem.startBalance.rawValue],
                        componentsList[DashboardItem.actualBalance.rawValue],
                        componentsList[DashboardItem.averageGoal.rawValue],
                        componentsList[DashboardItem.spentSoFar.rawValue]]),
    TableViewDashBoard(title: "Chart Expenses",
                       itens: []),
    TableViewDashBoard(title: "Expenses Review",
                       itens: [
                        componentsList[DashboardItem.averageSpent.rawValue],
                        componentsList[DashboardItem.averageLeftOver.rawValue],
                        componentsList[DashboardItem.today.rawValue],
                        componentsList[DashboardItem.yesterday.rawValue]])
]



let componentsList: [InfosDashBoard] = [
    InfosDashBoard(title: "Start Balance", iconImage: "start", valueDouble: 743.0),
    InfosDashBoard(title: "Actual Balance", iconImage: "wallet", valueDouble: 240.03),
    InfosDashBoard(title: "Average\nGoal", iconImage: "target", valueDouble: 24.74, subtitleString: "This is THE right way! :)"),
    InfosDashBoard(title: "Spent\nSo Far", iconImage: "expenses", valueDouble: -212.39, subtitleString: "Remeber to save money."),
    
    InfosDashBoard(title: "Average\nSpent", modeIcon: ModeIcon.percentInv, valueDouble: 29.48, percentValue: 0.5, unit: "/ day", subtitleString: "Average daily spending you have done so far."),
    InfosDashBoard(title: "Average \nLeft Over", modeIcon: ModeIcon.percent, valueDouble: 24.39, percentValue: -0.5, unit: "/ day", subtitleString: "Average daily spending limit, but you won't."),
    
   InfosDashBoard(title: "Today", modeIcon: ModeIcon.percentInv, valueDouble: 19.48, percentValue: -0.5, subtitleString: "How much you spent today."),
    InfosDashBoard(title: "Yesterday", modeIcon: ModeIcon.percentInv, valueDouble: 23.39, percentValue: 0.5, subtitleString: "How much you spent yesterday.")
]
