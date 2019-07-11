//
//  GraphViewController.swift
//  p04-reid-master
//
//  Created by Matthew Reid on 7/10/19.
//  Copyright © 2019 Matthew Reid. All rights reserved.
//

import UIKit
import Charts

class GraphViewController: UIViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var yVals = [Double]()
    var multiplier : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yVals = Globals.yVals

        drawGraph()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backPressed(_sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func drawGraph() {
        let yse1 = self.yVals.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y) }
        let data = LineChartData()
        let ds1 = LineChartDataSet(values: yse1, label: "")
        
        ds1.mode = .cubicBezier
        
        ds1.drawValuesEnabled = false
        ds1.colors = [NSUIColor.blue]
        ds1.drawCirclesEnabled = true
        ds1.circleHoleColor = NSUIColor.init(red: 109/255, green: 176/255, blue: 198/255, alpha: 1.0)
        ds1.circleRadius = 5.0
        ds1.drawCircleHoleEnabled = false
        ds1.circleColors = [NSUIColor.white]
        ds1.lineWidth = 3.0
        ds1.drawHorizontalHighlightIndicatorEnabled = false
        
        let colorGradient = [UIColor.init(red: 109/255, green: 176/255, blue: 198/255, alpha: 1.0).cgColor, UIColor.init(red: 62/255, green: 126/255, blue: 213/255, alpha: 0.6).cgColor] as CFArray
        let colorLocations : [CGFloat] = [1.0, 0.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colorGradient, locations: colorLocations)
        ds1.fill =  Fill.fillWithLinearGradient(gradient!, angle: 90.0)
        ds1.drawFilledEnabled = true
        
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 9)!)
        data.setDrawValues(true)
        
        data.addDataSet(ds1)
        
        
        
        self.lineChartView.drawGridBackgroundEnabled = false
        self.lineChartView.xAxis.drawAxisLineEnabled = false
        self.lineChartView.xAxis.drawGridLinesEnabled = false
        self.lineChartView.rightAxis.enabled = false
        self.lineChartView.leftAxis.drawGridLinesEnabled = false
        self.lineChartView.xAxis.enabled = false
        self.lineChartView.chartDescription?.text = nil
        self.lineChartView.animate(xAxisDuration: 0.5, yAxisDuration: 2.0)
        self.lineChartView.dragEnabled = true
        self.lineChartView.pinchZoomEnabled = false
        self.lineChartView.doubleTapToZoomEnabled = false
        self.lineChartView.data = data
        self.lineChartView.drawMarkers = true
        self.lineChartView.highlightPerDragEnabled = true
    }
}
