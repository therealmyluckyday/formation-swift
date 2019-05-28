//
//  UIResponder+MLD.swift
//  FormationSwift
//
//  Created by MacBook on 5/28/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import UIKit

extension UIResponder {
    
    struct AssociatedKeys {
        static var previousFormItem = "previousFormItem"
        static var nextFormItem = "nextFormItem"
    }
    
    private static weak var _currentFirstResponder: UIResponder?
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    @IBOutlet
    var previousFormItem: UIResponder? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.previousFormItem) as? UIResponder }
        set { objc_setAssociatedObject(self, &AssociatedKeys.previousFormItem, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    @IBOutlet
    var nextFormItem: UIResponder? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.nextFormItem) as? UIResponder }
        set { objc_setAssociatedObject(self, &AssociatedKeys.nextFormItem, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    @objc private func findFirstResponder(_ sender: Any?) {
        UIResponder._currentFirstResponder = self
    }
}
