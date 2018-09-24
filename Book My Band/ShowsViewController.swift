//
//  ShowsViewController.swift
//  Book My Band
//
//  Created by Matt Huston on 9/13/18.
//  Copyright © 2018 Matt Huston. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ShowsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var BandData: UITextView!
    
    @IBOutlet weak var TableView: UITableView!
    
    var arrRes = [[String:AnyObject]]()
    
    
    var bandData = ""
    var bandsArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BandData.text = bandData
        
        
        
        Alamofire.request("https://bookmybandserver.herokuapp.com/bands").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
//                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["bands"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                    print(self.arrRes)
                }
                if self.arrRes.count > 0 {
                    self.TableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
//                   forRowAtIndexPath indexPath: NSIndexPath)
//    {
//        if (indexPath.row % 2 == 0)
//        {
//            cell.backgroundColor = UIColor.blue
//        } else {
//            cell.backgroundColor = UIColor.white
//        }
//    }
    
    
    
    // Do any additional setup after loading the view.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
