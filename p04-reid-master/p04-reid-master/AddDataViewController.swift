//
//  AddDataViewController.swift
//  p04-reid-master
//
//  Created by Matthew Reid on 7/10/19.
//  Copyright © 2019 Matthew Reid. All rights reserved.
//

import UIKit

class AddDataViewController: UIViewController {

    var images = [UIImageView]()
    var buttons = [UIButton]()
    
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    
    
    @IBOutlet weak var sineFunc: UIButton!
    @IBOutlet weak var linear: UIButton!
    @IBOutlet weak var script: UIButton!
    
    @IBOutlet weak var txtField: UILabel!
    
    @IBOutlet weak var sliderView: UISlider!
    
    var sineValues = [Double]()
    var linearValues = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sineValues = [0, 1, 0, -1]
        linearValues = [2, 4, 6, 8]
        
        buttons = [sineFunc, linear]
        images = [img1, img2]
        
        for elem in images {
            elem.isHidden = true
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        txtField.text = "Value: \(Int(sliderView.value))"
        Globals.multiplier = Int(sliderView.value)
    }
    
    @IBAction func sinePressed(_ sender: UIButton) {
        for elem in images {
            elem.isHidden = true
        }
        img1.isHidden = false
        Globals.yVals = self.sineValues
    }
    
    @IBAction func linearPressed(_ sender: UIButton) {
        for elem in images {
            elem.isHidden = true
        }
        img2.isHidden = false
        Globals.yVals = self.linearValues
    }
    

    
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        let Url = String(format: "https://github.com/profmadden/http-example/blob/master/php/double.php")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["value" : Int(sliderView.value)]
        
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                    if let dictionary = json as? [String: Any] {
                        if let number = dictionary["value"] as? Double {
                            Globals.multiplier = Int(number)
                            self.dismiss(animated: true, completion: nil)
                            }
                        }
                    } catch {
                    print(error)
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }.resume()
        }

}

