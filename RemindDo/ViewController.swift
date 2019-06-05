//
//  ViewController.swift
//  RemindDo
//
//  Created by Nathachai Bangkung on 4/20/19.
//  Copyright © 2019 Nathachai Bangkung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topicTableView: UITableView!
    let data = DataCollection()
    
    @IBAction func tappedAdd(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Topic", message: "Please enter new topic", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        
        let addAction = UIAlertAction(title: "Add", style: .default){ _ in
            let inputTopic = alert.textFields![0].text ?? ""
            let toTableTopic = DataTodoModel(topic: inputTopic)  // Init
            self.data.dataCollect.append(toTableTopic)
            //self.topicTableView.reloadData()
            let indexPath = IndexPath(row: self.data.dataCollect.count-1, section: 0)
            self.topicTableView.insertRows(at: [indexPath], with: .right)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedPersonIndex = sender as! Int
        let selectedPersonDetail = segue.destination as! PersonListViewController

        selectedPersonDetail.indexPerson = selectedPersonIndex
        selectedPersonDetail.handedData = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Do-dos"
        self.topicTableView.dataSource = self
        self.topicTableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.dataCollect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TopicTableViewCell") as? TopicTableViewCell {
            let index = indexPath.row
            cell.loadData(topic: self.data.dataCollect[index].topic)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.data.dataCollect.remove(at: indexPath.row)
            self.topicTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        performSegue(withIdentifier: "ToPersonList", sender: indexPath.row)
    }
    
}
