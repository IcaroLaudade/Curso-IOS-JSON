//
//  Curso.swift
//  Curso
//
//  Created by Student on 09/10/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//

import Foundation
class Materia {
    var materia:String
    var cargaHoraria: String
    var professor: String
    var periodo: String
    var curso :String
    var alunos: [Aluno]
    
    init(json: [String: AnyObject]) {
        self.cargaHoraria = json["cargahoraria"] as? String ?? ""
        self.professor = json["professor"] as? String ?? ""
        self.periodo = json["periodo"] as? String ?? ""
        self.materia = json["nomemateria"] as? String ?? ""
        self.curso = json["nomecurso"] as? String ?? ""
        self.alunos = [Aluno]()
        
        if let aluno = json["alunos"] as? [[String:String]] {
            for jsonAluno in aluno {
                let novoAluno = Aluno(json: jsonAluno)//aluno(json: jsonAluno)
                self.alunos.append(novoAluno)
            }
        }
    }
}//nome ra idade

class Aluno{
    var nome: String
    var ra: String
    var idade: String
    
    init(json: [String: String]) {
        self.nome = json["nome"] ?? ""
        self.idade = json["idade"] ?? ""
        self.ra = json["ra"] ?? ""
    }
}

class MateriaDAO {
    static func getAlunos()->[Aluno]{
        var listaAlunos = [Aluno]()
        MateriaDAO.getMateria{(materia) in
            for i in materia.alunos{
              //  print("ola \( i.nome)")
                listaAlunos.append(i)
               // print("Ola sou aluno \(self.alunos.count) dentro do array alunos")
            }
        }
        return listaAlunos
    }
    
    static func getMateria (callback: @escaping ((Materia) -> Void)) {
        
        let endpoint: String = "https://metodista-tarde-nodealuno25.mybluemix.net/pegarnome"
        
        guard let url = URL(string: endpoint) else {
            print("Erroooo: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                        let materia = Materia(json: json[0])
                        
                        let nomeCurso = materia.materia
                        
                        print("\(nomeCurso) tem \(materia.professor)")
                        
                        callback(materia)
                        
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
            }
        })
        
        task.resume()
    }
}
