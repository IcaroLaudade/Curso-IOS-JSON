//
//  AlunoTableViewCell.swift
//  Curso
//
//  Created by Icaro Alcantara Laudade on 10/10/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//

import UIKit

class AlunoTableViewCell: UITableViewCell {

    @IBOutlet weak var raAluno: UILabel!
    @IBOutlet weak var idadeAluno: UILabel!
    @IBOutlet weak var nomeAluno: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
