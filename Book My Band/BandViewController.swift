//
//  BandViewController.swift
//  Book My Band
//
//  Created by Matt Huston on 9/13/18.
//  Copyright © 2018 Matt Huston. All rights reserved.
//

import UIKit
import GooglePlaces
import Alamofire

class BandViewController: UIViewController, UITextFieldDelegate  {
    
    var bandInfo = ""
    
    @IBOutlet weak var BandName: UITextField!
    @IBOutlet weak var Genre: UITextField!
    @IBOutlet weak var Website: UITextField!
    @IBOutlet weak var Date: UITextField!
    @IBOutlet weak var Location: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Message: UITextField!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BandName.delegate = self
        Genre.delegate = self
        Website.delegate = self
        Date.delegate = self
        Location.delegate = self
        Email.delegate = self
        Message.delegate = self
        
//        Message.delegate = self as! UITextViewDelegate
        

        // Do any additional setup after loading the view.
//        txtSearch.delegate = self
    }
    
    //MARK:- UITextFieldDelegate
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        searchPlaceFromGoogle(place: textField.text!)
//        return true
//    }
//
//    func searchPlaceFromGoogle(place:String) {
//        var strGoogleApi = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(place)&key=AIzaSyDxkNnyp5RgnPDmAqtOdsZFOMU-xW1nPM8"
//        strGoogleApi = strGoogleApi.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//        var urlRequest = URLRequest(url: URL(string: strGoogleApi)!)
//        urlRequest.httpMethod = "GET"
//        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if error == nil {
//                let jsonDict = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//                print("json ==\(jsonDict)")
//            } else {
//
//            }
//        }
//        task.resume()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SubmitButton(_ sender: Any) {
        self.bandInfo = "Band Name: \(BandName.text!)\nGenre: \(Genre.text!)\nWebsite: \(Website.text!)\nDate: \(Date.text!)\nLocation: \(Location.text!)\nEmail: \(Email.text!)\nMessage: \(Message.text!)"
        performSegue(withIdentifier: "BandInfo", sender: self)
        
        let parameters = [
            "band_name": "\(BandName.text!)",
            "genre": "\(Genre.text!)",
            "website": "\(Website.text!)",
            "location": "\(Location.text!)",
            "date": "\(Date.text!)",
            "email": "\(Email.text!)",
            "message": "\(Message.text!)"
        ]
        
        Alamofire.request("https://bookmybandserver.herokuapp.com/bands", method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                
                break
            case .failure(let error):
                
                print(error)
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ShowsViewController
        vc.bandData = self.bandInfo
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        BandName.resignFirstResponder()
        Genre.resignFirstResponder()
        Website.resignFirstResponder()
        Date.resignFirstResponder()
        Location.resignFirstResponder()
        Email.resignFirstResponder()
        Message.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == BandName {
            textField.resignFirstResponder()
            Genre.becomeFirstResponder()
        } else if textField == Genre {
            textField.resignFirstResponder()
            Website.becomeFirstResponder()
        } else if textField == Website{
            textField.resignFirstResponder()
            Date.becomeFirstResponder()
        }else if textField == Date{
            textField.resignFirstResponder()
            Location.becomeFirstResponder()
        }else if textField == Location{
            textField.resignFirstResponder()
            Email.becomeFirstResponder()
        }else if textField == Email{
            textField.resignFirstResponder()
            Message.becomeFirstResponder()
        }else if textField == Message{
            textField.resignFirstResponder()

        }
        return true
    }
}


extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
}


