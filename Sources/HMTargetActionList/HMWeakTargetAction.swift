//
//  HMWeakTargetAction.swift
//
//  Created by Hiroaki Muronaka on 2021/10/08.
//
import Foundation

internal struct HMWeakTargetAction {
    
    weak var target: AnyObject?
    var action: Selector
    
    init(target: AnyObject?, action: Selector) {
        self.target = target
        self.action = action
    }
}

extension HMWeakTargetAction: Equatable {
    
    static func == (lhs: HMWeakTargetAction, rhs: HMWeakTargetAction) -> Bool {
        if lhs.target == nil && rhs.target == nil {
            return lhs.action == rhs.action
        }
        
        if lhs.target == nil || rhs.target == nil {
            return false
        }
        return (lhs.target!.isEqual(rhs.target!) && lhs.action == rhs.action)
    }
    
}
