//
//  ErrorMessage.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 25/06/22.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidUsername = "Você não informou nenhum usuário, por favor informe um usuário"
    case unableToComplete = "Houve um problema com os dados do usuario, por favor tente novamente."
    case invalidResponse = "Servidor não esta respondendo. Por favor, tente novamente."
    case invalidData = "Dados recebidos do server é invalido. Por favor, tente novamente."
}
