//
//  ViewController.swift
//  MyFirstProject
//
//  Created by Aleksandra Avramenko on 8/23/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var MyPhoto: UIImageView!
    @IBOutlet weak var MySetImage: UIPickerView!
    
    let MySetImageData = [String](arrayLiteral: "Colby College", "Harvard University", "Princeton", "Haverford College", "MIT", "Stanford", "Bates College")
    
    let collegeImages: [String: String] = ["Colby College": "colby", "Harvard University": "harvard", "Princeton": "princeton", "Haverford College": "haverford", "MIT": "mit", "Stanford": "stanford", "Bates College": "bates"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MySetImage.delegate = self
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
            let randomColor = changeColor()
            view.backgroundColor = randomColor
    }
    
    func changeColor() -> UIColor{

            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)

            return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
        }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        MySetImageData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return MySetImageData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCollege = MySetImageData[row]
        
        if let imageName = collegeImages[selectedCollege] {
            MyPhoto.image = UIImage(named: imageName)
        }
    }
}

