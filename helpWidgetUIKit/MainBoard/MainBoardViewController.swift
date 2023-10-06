//
//  MainBoardViewController.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 06/10/23.
//

import UIKit

class MainBoardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension MainBoardViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap here!")
    }
}

extension MainBoardViewController: UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //define o numero de linhas na tabela
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        
        return cell
    }
}
