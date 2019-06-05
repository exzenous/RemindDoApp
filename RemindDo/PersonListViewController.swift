//
//  PersonListViewController.swift
//  RemindDo
//
//  Created by Nathachai Bangkung on 4/20/19.
//  Copyright © 2019 Nathachai Bangkung. All rights reserved.
//

import UIKit

class PersonListViewController: UIViewController {

    @IBOutlet weak var personListTable: UITableView!
    
    var handedData: DataCollection?
    var indexPerson: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = handedData!.dataCollect[indexPerson!].topic
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAddItem))
        self.personListTable.dataSource = self
        print(indexPerson!)
    }
    
    @objc func tapAddItem() {
        let alert = UIAlertController(title: "New List", message: "Enter new listing", preferredStyle: .alert)
        
        alert.addTextField()
        
        let addAction = UIAlertAction(title: "Add", style: .default){ _ in
            let inputList = alert.textFields![0].text ?? ""
            self.handedData!.dataCollect[self.indexPerson!].list.append(inputList)
            let indexPath = IndexPath(row: self.handedData!.dataCollect[self.indexPerson!].list.count-1, section: 0)
            self.personListTable.insertRows(at: [indexPath], with: .right)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension PersonListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return handedData!.dataCollect[indexPerson!].list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PersonListTableViewCell") as? PersonListTableViewCell{
            let index = indexPath.row
            cell.loadData(list: handedData!.dataCollect[indexPerson!].list[index])
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.handedData!.dataCollect[indexPerson!].list.remove(at: indexPath.row)
        self.personListTable.deleteRows(at: [indexPath], with: .automatic)
    }

}
