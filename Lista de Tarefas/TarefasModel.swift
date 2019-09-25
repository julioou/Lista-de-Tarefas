//
//  TarefasModel.swift
//  Lista de Tarefas
//
//  Created by Treinamento on 9/18/19.
//  Copyright © 2019 JCAS. All rights reserved.
//

import Foundation

class TarefasModel {
    
    var tarefasArray: [String] = []
    let dados = UserDefaults.standard
    let chave = "chave9"
    
    //MARK: - Salvando tarefas.
    func salvarTarefa(tarefa: String) {
        tarefasArray = carregarTarefas()
        tarefasArray.append(tarefa)
        dados.set(tarefasArray, forKey: chave)
        print("salvar tarefas executado")
    }
    
    //MARK: - Carregando tarefas.
    func carregarTarefas() -> Array<String> {
        let dadosSalvos = dados.object(forKey: chave)
        if dadosSalvos != nil {
            return dadosSalvos as! Array<String>
        }
        else {
            return []
        }
    }
    
    //MARK: - Deletando tarefas.
    func deletarTarefas(indice: Int) {
        tarefasArray = carregarTarefas()
        tarefasArray.remove(at: indice)
        dados.set(tarefasArray, forKey: chave)
    }
}
