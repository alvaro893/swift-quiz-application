//
//  SynonymsTableViewCell.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 18.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import UIKit

class SynonymsTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var synonymLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
