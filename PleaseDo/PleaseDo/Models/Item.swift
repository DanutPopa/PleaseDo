//
//  Item.swift
//  PleaseDo
//
//  Created by Danut Popa on 18.10.2025.
//

import Foundation
import FirebaseFirestore

struct Item: Identifiable, Equatable, Hashable {
    let id: String
    let authorId: String
    var title: String
    var description: String
    var startDate: Date
    var status: Status
    var priority: Priority
    
    static let example = Item(id: "12345", authorId: "Unknown", title: "Unknown", description: "Unknown", status: .unknown, priority: .low)
    
    init(data: [String: Any]) {
        id = data["id"] as! String
        authorId = data["authorId"] as! String
        title = data["title"] as! String
        description = data["description"] as! String
        
        let timestamp = data["startDate"] as! Timestamp
        startDate = timestamp.dateValue()
        
        let statusStr = data["status"] as! String
        status = Status(statusStr)
        
        let priorityStr = data["priority"] as! String
        priority = Priority(priorityStr)
    }
    
    init(id: String, authorId: String, title: String, description: String, startDate: Date = .now, status: Status, priority: Priority) {
        self.id = id
        self.authorId = authorId
        self.title = title
        self.description = description
        self.startDate = startDate
        self.status = status
        self.priority = priority
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
    
    static func empty() -> Item {
        Item(id: "", authorId: "", title: "", description: "", status: .todo, priority: .low)
    }
    
    func isDifferent(comparedTo item: Item) -> Bool {
        id != item.id
        || authorId != item.authorId
        || title != item.title
        || description != item.description
        || startDate != item.startDate
        || status != item.status || priority != item.priority
    }
    
    func toObject() -> [String: Any] {
        var data: [String: Any] = [:]
        data["id"] = id
        data["authorId"] = authorId
        data["title"] = title
        data["description"] = description
        data["startDate"] = Timestamp(date: startDate)
        data["status"] = status.rawValue
        data["priority"] = priority.rawValue
        
        return data
    }
}
