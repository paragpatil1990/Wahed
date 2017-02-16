//
//  OverviewViewController.swift
//  Wahed
//
//  Created by Amrit Singh on 2/10/17.
//  Copyright © 2017 InfoManav. All rights reserved.
//

import UIKit

class OverviewViewController: BaseViewController {
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        addRightBarButtonWith(imagename: "user", target: self, selector: #selector(btnMyAccount_Clcik(_:)))
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

//    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var circleGraph: CircleGraphView!
//    @IBOutlet weak var whiteGraph: CircleGraphView!
//    @IBOutlet weak var redGraph: CircleGraphView!
//    @IBAction func slider(sender: UISlider) {
//        circleGraph.endArc = CGFloat(sender.value)
//        percentLabel.text = String(format:" %5.2f %%",sender.value * 100)
//    }
//    @IBAction func whiteSlider(sender: UISlider) {
//        whiteGraph.endArc = CGFloat(sender.value)
//    }
//    @IBAction func redSlider(sender: UISlider) {
//        redGraph.endArc = CGFloat(sender.value)
//    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let backgroundTrackColor = UIColor(white: 0.15, alpha: 1.0)
//        circleGraph.arcBackgroundColor = backgroundTrackColor
//        circleGraph.arcColor = .red
//        circleGraph.arcWidth = 20.0
//        circleGraph.endArc = 10.0/100.0
        
//        whiteGraph.arcWidth = 25.0
//        whiteGraph.arcColor = UIColor.white
//        whiteGraph.endArc = 0.5
//        whiteGraph.arcBackgroundColor = backgroundTrackColor
//        
//        redGraph.endArc = 0.25
//        redGraph.arcColor = UIColor.red
//        redGraph.arcWidth = 20.0
//        redGraph.arcBackgroundColor = backgroundTrackColor
        
        addRightBarButtonWith(imagename: "user", target: self, selector: #selector(btnMyAccount_Clcik(_:)))

        
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
