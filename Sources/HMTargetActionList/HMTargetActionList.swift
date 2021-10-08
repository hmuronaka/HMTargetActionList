//
//  HMTargetActionList.swift
//
//  Created by Hiroaki Muronaka on 2021/10/08.
//

import Foundation

open class HMTargetActionList {
    
    internal private(set) var targetActionList = [HMWeakTargetAction]()
    
    public init() {
    }
    
    open func addTarget(_ target: AnyObject, action: Selector) {
        let item = HMWeakTargetAction(target: target, action: action)
        if !contains(item: item) {
            targetActionList.append(item)
        }
    }
    
    open func removeTarget(_ target: AnyObject, action: Selector) {
        let item = HMWeakTargetAction(target: target, action: action)
        if let idx = targetActionList.firstIndex(of: item) {
            targetActionList.remove(at: idx)
        }
    }
    
    open func removeActions(_ target: AnyObject) {
        var idx = self.targetActionList.count - 1
        while( idx >= 0) {
            if let idxTarget = targetActionList[idx].target, idxTarget.isEqual(target) {
                targetActionList.remove(at: idx)
            }
            idx -= 1
        }
    }
    
    open func removeAll() {
        self.targetActionList.removeAll()
    }
    
    open func fire(_ sender: Any) {
        for item in self.targetActionList {
            _ = item.target?.perform(item.action, with: sender)
        }
    }
    
    private func contains(item: HMWeakTargetAction) -> Bool {
        targetActionList.contains(where: {$0 == item})
    }
    
    
}
