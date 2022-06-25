//
//  CategoryImagesViewController.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 18.06.2022.
//

import UIKit

class CategoryImagesViewController: UIViewController {
    
    var categoriesInDict = UserImage()
    
    var categoriesOfImage = ["Space", "Animals", "Plant", "Yellow Thinking", "Home Decor and Design"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
}

extension CategoryImagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesOfImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CategoryCell")
        
        cell.textLabel?.text = categoriesOfImage[indexPath.row]
        
        return cell
    }
    
    
    
    
}

extension CategoryImagesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToImage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.categoryImage = categoriesOfImage[indexPath.row]
            
        }
    }
    

    
}
