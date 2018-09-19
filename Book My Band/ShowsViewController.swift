//
//  ShowsViewController.swift
//  Book My Band
//
//  Created by Matt Huston on 9/13/18.
//  Copyright © 2018 Matt Huston. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController {

    @IBOutlet weak var BandData: UITextView!
    
    
    var bandData = ""
     var bandsArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BandData.text = bandData
        
        
            guard let url = URL(string: "https://bookmybandserver.herokuapp.com/bands") else {return}
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let dataResponse = data,
                    error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        return }
                do{
                    //here dataResponse received from a network request
                    let myJson = try JSONSerialization.jsonObject(with:
                        dataResponse, options: [])
                    print(myJson) //Response result
                    

                } catch let parsingError {
                    print("Error", parsingError)
                }
            }
            task.resume()
        }
    

        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
