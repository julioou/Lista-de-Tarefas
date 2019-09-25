//
//  TarefasTableViewController.swift
//  Lista de Tarefas
//
//  Created by Treinamento on 9/18/19.
//  Copyright © 2019 JCAS. All rights reserved.
//

import UIKit

class TarefasTableViewController: UITableViewController {
    
    var tarefasArray: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tarefasArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "tarefasCel", for: indexPath)
        if let tarefas = tarefasArray?[indexPath.row]{
            cel.textLabel?.text = tarefas
        }
        
        return cel
    }
    //Função que atualiza a lista e recarrega a table view.
    func atuliazarLista(){
        let tm = TarefasModel()
        tarefasArray = tm.carregarTarefas()
        tableView.reloadData()
    }
    //Função que deleta a tarefa conforme o indice da linha.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let tm = TarefasModel()
            tm.deletarTarefas(indice: indexPath.row)
            atuliazarLista()
        }
    }
    
    //Sempre que a tela aparecer ele ira executar a função de atulizar a table view.
    override func viewDidAppear(_ animated: Bool) {
        atuliazarLista()
    }
}
