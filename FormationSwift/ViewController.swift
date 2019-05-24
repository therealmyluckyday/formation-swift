//
//  ViewController.swift
//  FormationSwift
//
//  Created by MacBook on 5/21/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        example()
        exercise1()
    }
    
    private func example() {
        // Create the view
        let label = UILabel()
        
        // Configure the view
        label.text = "Hello, World"
        label.textColor = .blue
        
        // Set the layout
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 50, y: 50)
        
        // Add to parent
        view.addSubview(label)
    }
    
    private func exercise1() {
        // TODO: Add another label and a button
        // When the button is tapped, change the text
        
        
    }

}

