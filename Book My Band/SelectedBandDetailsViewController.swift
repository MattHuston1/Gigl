//
//  SelectedBandDetailsViewController.swift
//  Book My Band
//
//  Created by Matt Huston on 9/24/18.
//  Copyright © 2018 Matt Huston. All rights reserved.
//

import UIKit

class SelectedBandDetailsViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var BandDetailsTextView: UITextView!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = ("ID: \(index!)")

    }
    
    @IBAction func Book(_ sender: Any) {
    }
    
}
