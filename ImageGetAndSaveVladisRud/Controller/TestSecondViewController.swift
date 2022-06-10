//
//  TestSecondViewController.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 09.06.2022.
//

import UIKit

class TestSecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var testTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "testID", for: indexPath)
        
        cell.textLabel?.text = "KJFDAFKLJDAKLFJDAKLFJLK"
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testTable.dataSource = self
        
        testTable.delegate = self
        
        

        // Do any additional setup after loading the view.
    }
    

    
}
