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
//        var strIndex = String(describing: index)
//        print(strIndex)
//        print(type(of: strIndex))
//        print(arrRes[index])
        label.text = ("You tapped the cell at index \(index)")
//        label.text = String(describing: arrRes)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Book(_ sender: Any) {
    }
    
}
