//
//  TopicTableViewCell.swift
//  RemindDo
//
//  Created by Nathachai Bangkung on 4/25/19.
//  Copyright © 2019 Nathachai Bangkung. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    @IBOutlet weak var topicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(topic: String) {
        self.topicLabel.text = topic
    }

}
