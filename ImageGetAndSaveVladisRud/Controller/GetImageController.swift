//
//  GetImageController.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 01.08.2022.
//

import UIKit

class GetImageController: UIViewController {

    //MARK: - Variable and constant
    var categoryImage = ""
    var randomImage = UserImage()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        randomImage.loadImage(category: categoryImage)
        
        
        view.backgroundColor = .white
        view.addSubview(labelView)
//        labelView.addSubview(nameLable)
        
        view.addSubview(userImage)
        
        view.addSubview(buttonView)
        buttonView.addSubview(buttonStack)
        buttonStack.addArrangedSubview(getButton)
        buttonStack.addArrangedSubview(saveButton)
        
        setUpConstrains()
    }
    
    //MARK: - Elements of UI
    let labelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GetImageAndSave"
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 25.0)
        return label
    }()
    
    let userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .redraw
        return image
    }()
    
    let buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 100
        return stack
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Get", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.addTarget(self, action: #selector(getImage), for: .touchUpInside)
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Save", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.addTarget(self, action: #selector(saveImage), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Constains of UI
    func setUpConstrains() {
        // label
        labelView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        labelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        labelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        labelView.heightAnchor.constraint(equalToConstant: view.frame.height / 6).isActive = true
//        nameLable.centerXAnchor.constraint(equalTo: labelView.centerXAnchor).isActive = true
//        nameLable.centerYAnchor.constraint(equalTo: labelView.centerYAnchor).isActive = true
        
        // image
        userImage.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 20).isActive = true
        userImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        userImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
//        userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        
        // button
        buttonView.topAnchor.constraint(equalTo: userImage.bottomAnchor).isActive = true
        buttonView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        buttonView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        buttonStack.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor).isActive = true
        buttonStack.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        getButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    //MARK: - Button function
    @objc func getImage() {
        randomImage.loadImage(category: categoryImage)
        // 1 - Получаем API
        let API = "\(randomImage.urlPhoto)"
        
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
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Success")
        }
    }
    
    @objc func saveImage() {
        guard let savedImage = userImage.image else {
            return
        }
        UIImageWriteToSavedPhotosAlbum(savedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    
    

}
