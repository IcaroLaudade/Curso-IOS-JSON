//
//  AlunoTableViewController.swift
//  Curso
//
//  Created by Icaro Alcantara Laudade on 10/10/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//

import UIKit

class AlunoTableViewController: UITableViewController {
    
    var alunos = [Aluno]()
    
    @IBAction func carregar(_ sender: Any) {
        MateriaDAO.getMateria{(materia) in
            for i in materia.alunos{
                //  print("ola \( i.nome)")
               self.alunos.append(i)
                // print("Ola sou aluno \(self.alunos.count) dentro do array alunos")
            }
        }
        tableView.reloadData()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
      //  alunos = MateriaDAO.getAlunos()
       
        
        print("ALUNOS FORA DO GET \(self.alunos.count))")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("****************************", alunos.count)
        return self.alunos.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alunoIdentifier", for: indexPath) as! AlunoTableViewCell
        
        cell.nomeAluno.text = alunos[indexPath.row].nome
        print("**********************************************", alunos[indexPath.row].nome)
        cell.raAluno.text = alunos[indexPath.row].ra
        cell.idadeAluno.text = alunos[indexPath.row].idade
        // Configure the cell...
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
