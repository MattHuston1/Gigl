//
//  SelectedBandDetailsViewController.swift
//  Book My Band
//
//  Created by Matt Huston on 9/24/18.
//  Copyright © 2018 Matt Huston. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SelectedBandDetailsViewController: UIViewController {
    var bandArr = [[String:AnyObject]]()
    
    @IBOutlet weak var BandName: UILabel!
    @IBOutlet weak var Genre: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var Message: UILabel!
    @IBOutlet weak var Website: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://bookmybandserver.herokuapp.com/bands/\(index!)").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let band = swiftyJsonVar["bands"]
                let bandName = band["band_name"]
                let genre = band["genre"]
                let email = band["email"]
                let location = band["location"]
                let message = band["message"]
                let website = band["website"]
                let date = band["date"]
                let strDate = "\(date)"
                let newDate = strDate.prefix(10)
                self.BandName?.text = ("\(bandName)")
                self.Genre?.text = ("\(genre)")
                self.Email?.text = ("\(email)")
                self.Location?.text = ("\(location)")
                self.Message?.text = ("\(message)")
                self.Website?.text = ("\(website)")
                self.Date?.text = ("\(newDate)")

//                if let resData = swiftyJsonVar["bands"].arrayObject {
//                    self.bandArr = resData as! [[String:AnyObject]]
//            }
    

    
}
}
}
}
