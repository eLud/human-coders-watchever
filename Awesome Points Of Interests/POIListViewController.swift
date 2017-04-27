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
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(refreshList), name: Notification.Name("DirectoryUpdated"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshList() {
        tableView.reloadData()
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        //On identifie le segue via son ID
        if segue.identifier == "showForm" {
            
            // On s'assure d'avoir le bon controller puis on passe les infos
            guard let destination = segue.destination as? ViewController else { return }
            destination.desiredColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
    }
 

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

extension POIListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentPoi = Directory.instance.allPois[indexPath.row]
        
        // On récupère le controller via son Storyboard ID
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "PoiDetailsViewController") as? PoiDetailsViewController else { return }
        controller.currentPoi = currentPoi
        self.navigationController?.pushViewController(controller, animated: true)
        
        //Si on voulait du modal, on aurait déclenché la transition comme ça
//        controller.modalTransitionStyle = .flipHorizontal
//        present(controller, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
