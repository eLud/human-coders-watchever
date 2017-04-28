//
//  ViewController.swift
//  Awesome Points Of Interests
//
//  Created by Ludovic Ollagnier on 25/04/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

extension UIView {
    
    func goRed() {
        
        UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: [.autoreverse], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
                self.transform = CGAffineTransform(translationX: -10, y: 0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                
                let transform = CGAffineTransform()
                transform.translatedBy(x: 10, y: 0)
                transform.scaledBy(x: 2, y: 2)
                
                self.transform = transform

            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.3, animations: {
                self.transform = CGAffineTransform(translationX: -10, y: 0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1, animations: {
                self.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            
        }) { (completed) in
            
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var addressStackView: UIStackView!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    let directory = Directory.instance
    var desiredColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let color = desiredColor {
            view.backgroundColor = color
        }
        
        let prefs = UserDefaults.standard
//        prefs.set(true, forKey: "userAgreed")
        
        let userAgreed = prefs.bool(forKey: "userAgreed")
        print(userAgreed)
        
        prefs.synchronize()
        
        let fileManager = FileManager.default
        var  url = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url = url.appendingPathComponent("Photos/2017/65764GHFYHJH.jpg")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func savePOI(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) { 
            self.addressStackView.isHidden = !self.addressStackView.isHidden
        }
        
        addBlueBox()
        
        guard let name = nameTextField.text, name.characters.count > 3 else {
            nameTextField.goRed()
            return
        }
        guard let address = addressTextField.text, name.characters.count > 3 else { return }
        let index = typeSegmentedControl.selectedSegmentIndex
        guard let type = PointOfInterest.PoiType(rawValue: index) else { return }
        
        let poi = PointOfInterest(name: name, address: address, type: type, latitude: 0, longitude: 0, phoneNumber: "", websiteURL: nil, wikipediaPageURL: nil, numberOfReviews: 0, stars: 0, myReview: 0)
        
        directory.add(poi)
        print(directory.allPois)
        
        dismiss(animated: true, completion: nil)
    }
    
    private func addBlueBox() {
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(blueView)
//        let bottomConstraint = NSLayoutConstraint(item: blueView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
//        blueView.addConstraint(bottomConstraint)
        blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        blueView.goRed()
    }
}
