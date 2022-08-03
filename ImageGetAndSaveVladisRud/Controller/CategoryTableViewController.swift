//
//  CategoryTableViewController.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 01.08.2022.
//

import UIKit

class CategoryTableViewController: UIViewController {

    //MARK: - Variable and constant
    let categoriesInDict = UserImage()
    let categoriesOfImage = ["Space", "Animals", "Plant", "Yellow Thinking", "Home Decor and Design"]
    let iconOfImage = ["🌌", "🦫", "🪷", "💛", "🏠"]
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "GetImageAndSave"
        
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)

        setUpConstrains()
    }
    
    //MARK: - Element of UI
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: String.cell)
//        table.register(CategoryTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    //MARK: - Constains of UI
    func setUpConstrains() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension CategoryTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoriesOfImage.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell(style: .value1, reuseIdentifier: String.cell)

        cell.textLabel?.text = categoriesOfImage[indexPath.row]
        cell.detailTextLabel?.text = iconOfImage[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = GetImageController()
        
        image.categoryImage = categoriesOfImage[indexPath.row]
        
        navigationController?.pushViewController(image, animated: true)
        navigationItem.backButtonTitle = "Back"
        image.navigationItem.title = categoriesOfImage[indexPath.row]
    }
    
    


}


//MARK: - Constant
extension String {
    static let cell = "cell"
}
