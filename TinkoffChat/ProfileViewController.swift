//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Sergey Korobin on 20.09.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Photos
import AVFoundation

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var calledfunction: String!
    var imagePicker = UIImagePickerController()

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addPhotoButton: UIButton!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    
    // Метод, вызывающийся  после того, как вьюшка контроллера была загружена в память.
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        editButton.layer.cornerRadius = 10
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor.black.cgColor
        addPhotoButton.layer.cornerRadius = 45
        addPhotoButton.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.73, brightness: 0.94, alpha: 1.0).cgColor // #3f78f0
        addPhotoButton.tintColor = UIColor.white
        addPhotoButton.imageEdgeInsets = UIEdgeInsetsMake(20,20,20,20)
        profilePic.layer.cornerRadius = 45
        profilePic.clipsToBounds = true
        
        calledfunction = "Being called: " + FuncName() + "\n"
        print(calledfunction)
    }
    
    @IBAction func editAction(_ sender: Any) {
//        let button: UIButton = (sender  as? UIButton) ?? UIButton() - если нет, то сделай мне новую кнопку
//        button.titleLabel?.text = "kek"
        
//        if let button = sender as? UIButton {
//
//        }
//        ------------------------------------------
//        guard sender is UIButton else{
//            return
//        }
//        ------------------------------------------
//        button!.titleLabel!.text = "yo" // force inwrapping (можно в outlets) а так не стоит   
    }
    
    @IBAction func changeAvatarAction(_ sender: Any) {
        print("Выбери изображение профиля")
        let alertChooseVariantForPhotoMaking = UIAlertController(title: "Выберите способ", message: nil, preferredStyle: .actionSheet)
        alertChooseVariantForPhotoMaking.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alertChooseVariantForPhotoMaking.addAction(UIAlertAction(title: "Галлерея", style: .default, handler: { _ in
            self.openLibrary()
        }))
        
        alertChooseVariantForPhotoMaking.addAction(UIAlertAction.init(title: "Отменить", style: .cancel, handler: nil))
        
        self.present(alertChooseVariantForPhotoMaking, animated: true, completion: nil)
    }
    
    
    //Метод, вызывающийся перед появлением view на экране. Уже после viewDidLoad. Перед анимацией.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calledfunction = "Being called: " + FuncName() + "\n"
        print(calledfunction)
    }
    
    //Метод, вызывающийся после срабатывания viewWillAppear(). После анимации.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        calledfunction = "Being called: " + FuncName() + "\n"
        print(calledfunction)
    }
    
    //Метод, который вызвается при изменении layout’а view.
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calledfunction = "Being called: " + FuncName() + "\n"
        print(calledfunction)
    }
    
    //Метод, который вызвается после расстановки элементов на layout'е. После viewWillLayoutSubviews().
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calledfunction = "Being called: " + FuncName() + "\n"
        print(calledfunction)
    }
    
    //Метод, вызывающийся перед исчезновении view на экране. Перед анимацией.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        calledfunction = "Being called: " + FuncName() + "\n"
        print(calledfunction)
    }
    
    //Метод, вызывающийся после срабатывания viewWillDisappear(). После анимации.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        calledfunction = "Being called: " + FuncName() + "\n"
        print(calledfunction)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    //Функция, возвращающая имя функции, из которой она была вызвана.
    func FuncName(string: String = #function) -> String {
        return string
    }
    
    func openCamera(){
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        let warningNoCameraAlert  = UIAlertController(title: "Внимание", message: "Камера отсутствует!", preferredStyle: .alert)
        warningNoCameraAlert.addAction(UIAlertAction(title: "ОК, я в симуляторе relax", style: .default, handler: nil))
        
        let deniedCameraAccessCameraAlert  = UIAlertController(title: "Внимание", message: "Доступ к камере запрещен! Разрешите доступ к ней в настройках.", preferredStyle: .alert)
        deniedCameraAccessCameraAlert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        
        switch cameraAuthorizationStatus {
        case .denied:
            self.present(deniedCameraAccessCameraAlert, animated: true, completion: nil)
        case .authorized:
            if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
            {
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                self.imagePicker.allowsEditing = true
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            else
            {
                self.present(warningNoCameraAlert, animated: true, completion: nil)
            }
        case .restricted:
            self.present(deniedCameraAccessCameraAlert, animated: true, completion: nil)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
                if granted {
                    if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
                    {
                        self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                        self.imagePicker.allowsEditing = true
                        self.present(self.imagePicker, animated: true, completion: nil)
                    }
                    else
                    {
                        self.present(warningNoCameraAlert, animated: true, completion: nil)
                    }
                } else {
                    self.present(deniedCameraAccessCameraAlert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func openLibrary()
    {
        let photosStatus = PHPhotoLibrary.authorizationStatus()
        let deniedGalleryAccessAlert  = UIAlertController(title: "Ошибка", message: "Вход в галерею не был разрешен. Разрешите доступ к фото в настройках.", preferredStyle: .alert)
        deniedGalleryAccessAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        if photosStatus == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    self.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                    self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                    self.imagePicker.allowsEditing = true
                    self.present(self.imagePicker, animated: true, completion: nil)
                } else {
                    DispatchQueue.main.async {
                    self.present(deniedGalleryAccessAlert, animated: true, completion: nil)
                    }
                }
            })
        } else if photosStatus == .authorized
        {
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        } else {
            self.present(deniedGalleryAccessAlert, animated: true, completion: nil)
        }
        
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageEdited = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            profilePic.image = imageEdited
        }
        else if let imageOriginal = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            profilePic.image = imageOriginal
        }
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    

}

