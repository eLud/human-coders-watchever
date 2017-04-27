//
//  POIListViewController.swift
//  Awesome Points Of Interests
//
//  Created by Ludovic Ollagnier on 27/04/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class POIListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "POITableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "poiCell")
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

extension POIListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Directory.instance.allPois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "poiCell", for: indexPath) as? POITableViewCell else { fatalError("Wrong cell type !") }
            
        let currentPoi = Directory.instance.allPois[indexPath.row]
        cell.configure(with: currentPoi)
        
        return cell
    }
}
