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
    case previewMonth
    case nextMonth
    case nonClick = 300
}

enum TypeValue: Int {
    case value = 0
    case percent = 1
}

enum CSVColumns: Int {
    case date = 0
    case category
    case title
    case amount
}



struct InfosDashBoard {
    var title: String
    var typeComp: DashboardItem 
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
    var itens: [DashboardItem] = []
}

struct Purchase {
    let date: Date
    let category: String
    let title: String
    let amount: Double
    
    func dayString() -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MM/dd"
           return dateFormatter.string(from: date)
    }
    
}



