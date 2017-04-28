//
//  PoiDetailsViewController.swift
//  Awesome Points Of Interests
//
//  Created by Ludovic Ollagnier on 27/04/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class PoiDetailsViewController: UIViewController {
    
    var currentPoi: PointOfInterest?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = currentPoi?.name
                
        let url = URL(string: "https://developer.apple.com/swift/images/swift-og.png")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            print("OK")
            guard error == nil else { return }
            guard let data = data else { return }
            
            let image2 = UIImage(data: data)
            self.imageView2.image = image2
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }

            
        }
        task.resume()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.barTintColor = .green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
