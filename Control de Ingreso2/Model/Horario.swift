//
//  Horario.swift
//  Control de Ingreso2
//
//  Created by Esteban Choque Villalobos on 9/21/20.
//  Copyright © 2020 Esteban Choque Villalobos. All rights reserved.
//

import Foundation
import UIKit

struct Horario {
    let horCod:String
    let horNombre:String
    let horDescripcion:String
    let horDias:String
    let horHoraEntrada:String
    let horMinEntrada:String
    let horHoraSalida:String
    let horMinSalida:String
    let horEstado:String
    let recinto:Recinto
    let tipoVisitante:TipoVisitante
}
