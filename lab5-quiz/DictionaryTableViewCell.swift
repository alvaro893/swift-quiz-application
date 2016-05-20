//
//  DictionaryTableViewCell.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 17.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import UIKit

class DictionaryTableViewCell: UITableViewCell {
    //MARK: properties
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
