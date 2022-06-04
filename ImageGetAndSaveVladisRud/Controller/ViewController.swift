//
//  ViewController.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 04.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBAction func GetPhoto(_ sender: UIButton) {
        
        //MARK: - Получение фотографии по ссылке
        
        let userImageHeigth = Int(userImage.frame.height)
        
        let userImageWidth = Int(userImage.frame.width)
        
        // 1 - Получаем API
        let API = "https://picsum.photos/\(userImageWidth)/\(userImageHeigth)"
        
        // 2 - Создание URL
        guard let apiURL = URL(string: API) else {
            fatalError("WTFWTFWTFWTFWTFWTF")
        }
        
        // 3 - Инициализать сессию
        let session = URLSession(configuration: .default)
        
        // 4 - Создать запрос dataTask
        let task = session.dataTask(with: apiURL) { data, response, error in
            // 5 - Обработать полученные данные
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.userImage.image = UIImage(data: data)
            }
        }
        
        // 6 - Запустить запрос
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    

}

