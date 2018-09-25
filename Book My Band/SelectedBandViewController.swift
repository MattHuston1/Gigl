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

var arrRes = [[String:AnyObject]]()
var myIndex = 0

class SelectedBandViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var arrRes = [[String:AnyObject]]()


    @IBOutlet weak var BandInfoTableView: UITableView!
    
    @IBOutlet weak var Genre: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://bookmybandserver.herokuapp.com/bands").responseJSON { (responseData) -> Void in
//            print(responseData)
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
//                                print(swiftyJsonVar)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

//        let name = BandInfoTableView.visibleCells
//        print(name)

        // Get the index path from the cell that was tapped
        let indexPath = BandInfoTableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        let index = indexPath?.row
        let bandDetails = arrRes[index!]
        let bandID = bandDetails["id"]
        print(bandDetails["id"])
        // Get in touch with the DetailViewController
        let detailViewController = segue.destination as! SelectedBandDetailsViewController
        // Pass on the data to the Detail ViewController by setting it's indexPathRow value
        detailViewController.index = bandID as! Int
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var dict = arrRes[(indexPath as NSIndexPath).row]
//        print(dict)
//        print(dict["id"])
//        print(type(of: (dict["id"])))
        
        let id = (dict["id"])
//        let s = String(describing: id)
//        print(s)
//        print(type(of: s))

        
        cell.textLabel?.text = dict["band_name"] as? String
        cell.detailTextLabel?.text = String(describing: id!)
        
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.gray
        }
        return cell
    }
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            myIndex = indexPath.row
            print(arrRes[myIndex])
            performSegue(withIdentifier: "Segue", sender: self)
            
            //        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectedBandDetails")
            //        self.navigationController?.pushViewController(vc!, animated: true)
            //        print(vc)
            //        var name2 = String()
            //        BandInfoTableView.deselectRow(at: indexPath, animated: true)
            
        }
    }


        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
