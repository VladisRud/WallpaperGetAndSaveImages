//
//  ViewController.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 04.05.2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBAction func GetPhoto(_ sender: UIButton) {
        
        //MARK: - Получение фотографии по ссылке
        
        let userPhoneDispaySizeHeight = Int(UIScreen.main.bounds.height)
        
        let userPhoneDispaySizeWidth = Int(UIScreen.main.bounds.width)
        
        // 1 - Получаем API
        let API = "https://picsum.photos/\(userPhoneDispaySizeWidth)/\(userPhoneDispaySizeHeight)"
        
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
    
    @IBAction func SaveImage(_ sender: UIButton) {

        //MARK: - Сохранение фотографии в галерею пользователя
        guard let selectedImage = userImage.image else {
            return
            
        }
        
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    //MARK: - Save Image callback
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {

        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Success")
        }
        
    }


}

