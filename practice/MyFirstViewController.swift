//
//  MyFirstViewController.swift
//  practice
//
//  Created by GD Seo on 2018. 3. 21..
//  Copyright © 2018년 GD Seo. All rights reserved.
//

import UIKit

class MyFirstViewController: UIViewController {

    @IBOutlet weak var MyLabel: UILabel!
    
    @IBOutlet weak var MyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        self.MyLabel.text = "Hello World."
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
