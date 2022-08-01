//
//  CategoryImagesViewController.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 18.06.2022.
//

import UIKit

class CategoryImagesViewController: UIViewController {
    
    var categoriesInDict = UserImage()
    
    let categoriesOfImage = ["Space", "Animals", "Plant", "Yellow Thinking", "Home Decor and Design"]
    let iconOfImage = ["🌌", "🦫", "🪷", "💛", "🏠"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        
        tableView.separatorStyle = .none
        
    }
    
    
}

extension CategoryImagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesOfImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoriesCell
//        cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CategoryCell") as! CategoriesCell
        
//        cell.textLabel?.text = categoriesOfImage[indexPath.row]
        
        
        cell.categoriesName.text = categoriesOfImage[indexPath.row]
        cell.categoriesIcon.text = iconOfImage[indexPath.row]
        
        return cell
    }
    
    
    
    
}

extension CategoryImagesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
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
