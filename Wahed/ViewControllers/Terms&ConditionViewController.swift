//
//  Terms&ConditionViewController.swift
//  Wahed
//
//  Created by Amrit Singh on 2/9/17.
//  Copyright © 2017 InfoManav. All rights reserved.
//

import UIKit

class Terms_ConditionViewController: BaseViewController {

    @IBOutlet var view_tcContent: UIView!
    @IBOutlet var btn_Disagree: UIButton!
    @IBOutlet var btn_Agree: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        view_tcContent.clipsToBounds = true
        let htmlFile = Bundle.main.path(forResource: "WahedInvest_TC", ofType: "html")
        let htmlString = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
        let popup : ContentWebView  = ContentWebView(frame: view_tcContent.bounds)
        popup.show(complete: { (index) in
            print("INDEX : \(index)")
        }, view: view_tcContent, strMessage: htmlString!, strTitle: "Term & conditions")
    }
    
    @IBAction func btn_DissagreeClick(_ sender: UIButton){
        BaseViewController.setRootViewContoller(withIdentifier: "LoginViewController")
    }
    
    @IBAction func btn_AgreeClick(_ sender: UIButton) {
        BaseViewController.setRootViewContoller(withIdentifier: "LoginViewController")
    }
    
    override func didReceiveMemoryWarning()
    {
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
