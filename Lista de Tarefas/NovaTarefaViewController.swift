//
//  ViewController.swift
//  Lista de Tarefas
//
//  Created by Treinamento on 9/18/19.
//  Copyright © 2019 JCAS. All rights reserved.
//

import UIKit

class NovaTarefaViewController: UIViewController {

    @IBOutlet var campoTexto: UITextField!
    
    var tarefasModel = TarefasModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Adiciona novas tarefas recolhendo o texto no campo de texto.
    @IBAction func botaoAdicionar(_ sender: Any) {
        print("Botao adicionar acionado")
        let textoTarefa = campoTexto.text
        
        if textoTarefa?.count != 0 {
            self.tarefasModel.salvarTarefa(tarefa: textoTarefa!)
            let dados = self.tarefasModel.tarefasArray
            
            alertaConfig(tituloPrincipal: "Tarefa Adicionada!", menssagem: textoTarefa!)
            print(dados)
        }
        else {
            alertaConfig(tituloPrincipal: "Algo Errado!", menssagem: "Por favor digite um texto válido.")
            print("Não foi possível acessar o campo de texto")
        }
        
    }
    
    //Padronização de exibição de alerta.
    func alertaConfig(tituloPrincipal: String, menssagem: String) {
        let alerta = UIAlertController(title: tituloPrincipal, message: menssagem, preferredStyle: .alert)
        let alertaAction = UIAlertAction(title: "Fechar", style: .default) { (UIAlertAction) in
            self.campoTexto.text = ""
        }
        
        alerta.addAction(alertaAction)
        
        present(alerta, animated: true)
    }
    
    //Escode o teclado quando clicar fora.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

