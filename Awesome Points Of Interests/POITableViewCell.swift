//
//  POITableViewCell.swift
//  Awesome Points Of Interests
//
//  Created by Ludovic Ollagnier on 27/04/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var poiImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with poi: PointOfInterest) {
        
        typeLabel.text = poi.type.stringValue
        nameLabel.text = poi.name
        addressLabel.text = poi.address
        
        poiImageView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
