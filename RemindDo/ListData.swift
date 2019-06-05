//
//  ListData.swift
//  RemindDo
//
//  Created by Nathachai Bangkung on 4/20/19.
//  Copyright © 2019 Nathachai Bangkung. All rights reserved.
//

import Foundation

class DataCollection {
    var dataCollect: [DataTodoModel] = []
    //    [...,[name: "James", items: ["text_a0", "text_a1"] ], ...]
    //         ---------------- One Object ------------------
}

class DataTodoModel {
    
    var topic: String
    var list: [String]
    
    init(topic:String) {
        self.topic = topic
        self.list = []
        
    }
    
}
