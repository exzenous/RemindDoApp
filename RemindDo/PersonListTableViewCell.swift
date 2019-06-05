//
//  PersonListTableViewCell.swift
//  RemindDo
//
//  Created by Nathachai Bangkung on 4/20/19.
//  Copyright © 2019 Nathachai Bangkung. All rights reserved.
//

import UIKit

class PersonListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var toDoPersonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadData(list: String) {
        self.toDoPersonLabel.text = list
    }
}
