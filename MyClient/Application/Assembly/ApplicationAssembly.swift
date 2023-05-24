//
//  ApplicationAssembly.swift
//  MyClient
//
//  Created by Leonid Fedorov on 07.05.2023.
//

import Foundation
import Swinject

final class ApplicationAssembly {
    
    //Use default dependency
    class var assembler: Assembler {
        return Assembler([
            AuthAssembler(),
            RegistrationAssembler(),
            MainAssembler(),
            HomeAssembler(),
            AppointmentsAssembler(),
            CreateAppointAssembler(),
            SelectTimeAssembler(),
            SelectMasterAssembler(),
            SelectServiceAssembler(),
            SuccseccAssembler(),
            MyAppointAssembler()
        ])
}

var assembler: Assembler

//If you want use custom Assembler
init(with assemblies: [Assembly]) {
    assembler = Assembler(assemblies)
}

}
