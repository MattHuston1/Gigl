//
//  SelectedBandViewController.swift
//  Book My Band
//
//  Created by Matt Huston on 9/21/18.
//  Copyright © 2018 Matt Huston. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SelectedBandViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var BandInfoTableView: UITableView!
    
    var arrRes = [[String:AnyObject]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://bookmybandserver.herokuapp.com/bands").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                //                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["bands"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
//                    print(self.arrRes)
                }
                if self.arrRes.count > 0 {
                    self.BandInfoTableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        var dict = arrRes[(indexPath as NSIndexPath).row]
        print(dict)

        cell.textLabel?.text = dict["band_name"] as? String
        cell.detailTextLabel?.text = dict["genre"] as? String
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.gray
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var name2 = String()
//        BandInfoTableView.deselectRow(at: indexPath, animated: true)
//
//
//    }


        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
