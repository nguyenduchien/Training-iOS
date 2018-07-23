//
//  Array.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/14/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import Foundation
extension Array {
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    @discardableResult
    mutating func shuffle() -> Array {
        let count = self.count
        indices.lazy.dropLast().forEach {
            swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
        }
        return self
    }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}
