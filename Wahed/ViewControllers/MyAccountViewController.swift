//
//  MyAccountViewController.swift
//  Wahed
//
//  Created by Amrit Singh on 2/11/17.
//  Copyright © 2017 InfoManav. All rights reserved.
//

import UIKit

class MyAccountViewController: BaseViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addRightBarButtonWith(title: "Done", target: self, selector: #selector(btnDone_Clcik(_:)))
    }
    
    func btnDone_Clcik(_ sender : UIButton)
    {
        _ = navigationController?.popViewController(animated: true)
    }
    
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
