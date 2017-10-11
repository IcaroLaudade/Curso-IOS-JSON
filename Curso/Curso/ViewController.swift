//
//  ViewController.swift
//  Curso
//
//  Created by Student on 09/10/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nomeMateria: UILabel!
    @IBOutlet weak var cargaHoraria: UILabel!
    @IBOutlet weak var professor: UILabel!
    @IBOutlet weak var periodo: UILabel!
    @IBOutlet weak var nomeCurso: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botao(_ sender: Any) {
        MateriaDAO.getMateria{(materia) in
            self.cargaHoraria.text = String(describing: materia.cargaHoraria)
            self.professor.text = String(describing: materia.professor)
            self.periodo.text = String(describing: materia.periodo)
            self.nomeCurso.text = String(describing: materia.curso)
           self.nomeMateria.text =  String(describing: materia.materia)
            
        }
    }

}

