//
//  KeyboardResponder.swift
//  Flash Chat iOS13
//
//  Created by Zion Tuiasoa on 3/8/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

// For alternative ways of writing the ChatViewController when keyboard is enabled

import Foundation
import SwiftUI

class KeyboardResponder: ObservableObject {
    
    @Published var currentHeight: CGFloat = 0
    
    var _center: NotificationCenter
    
    init(center: NotificationCenter = .default) {
        _center = center
        
        // Tell the notification center to listen to the system keyboardWillShow and keyboardWillHide notification
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // lets make a function that returns the offset distance between any texfield and the top of the keyboard + a buffer margin of where we want the keyboard to be placed, so that every screen has the same buffer margin
    
    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            withAnimation {
                currentHeight = keyboardSize.height
            }
        }
    }
    
    @objc func keyBoardWillHide(notification: Notification) {
        withAnimation {
            currentHeight = 0
        }
    }
}
