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
    var scriptValues = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sineValues = [0, 1, 0, -1]
        linearValues = [2, 4, 6, 8]
        
        buttons = [sineFunc, linear, script]
        images = [img1, img2, img3]
        
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
        Globals.yVals = self.sineValues
    }
    
    @IBAction func linearPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func scriptPressed(_ sender: UIButton) {
        for elem in images {
            elem.isHidden = true
        }
        img1.isHidden = false
        
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
