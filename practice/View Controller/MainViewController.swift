//
//  MainViewController.swift
//  practice
//
//  Created by GD Seo on 2018. 3. 26..
//  Copyright © 2018년 GD Seo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    
    let sampleData = SampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.TableView.tableFooterView = UIView(frame: .zero)
        self.TableView.dataSource = self
        self.TableView.delegate = self
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sampleData.samples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainFeatureCell", for: indexPath) as! MainFeatureCell
        
        let data = self.sampleData.samples[indexPath.row]
        cell.TitleLabel.text = data.title
        cell.DescriptionLabel.text = data.description
        cell.FeatureImageView.image = UIImage(named: data.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) 번째 열이 선택됨.")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "PhotoObjectDetection", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "RealTimeObjectDetection", sender: nil)
        case 2:
            self.performSegue(withIdentifier: "FacialAnalysis", sender: nil)
        default:
            return
        }
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
