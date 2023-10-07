//
//  StructDashBoard.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 06/10/23.
//

import UIKit

let dashboarCount: Int = 8

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

enum TypeValue: Int {
    case value = 0
    case percent = 1
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
    var itens: [DashboardItem] = []
}
