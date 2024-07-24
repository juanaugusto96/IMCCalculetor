//
//  IMCResult.swift
//  IMC
//
//  Created by Juan augusto Roldan on 22/07/2024.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            Text("tu resultado").font(.title).bold().foregroundColor(.white)
            let result = calculateImc(weight: userWeight, height: userHeight)
            InformationView(result:result)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity).background(.backGroundCor)
    }
}
func calculateImc(weight:Double,height:Double) -> Double{
    
    let result = weight/((height/100)*(height/100))
    return result
    
    
}

struct InformationView:View{
    let result:Double
    var body: some View{
        
        let information = getImcResult(result: result)
        VStack{
            Spacer()
            Text(information.0).foregroundColor(information.2).font(.title).bold()
            Text("\(result,specifier:"%.2f")").font(.system(size:80)).bold().foregroundColor(.white)
            Spacer()
            Text(information.1).foregroundColor(.white).font(.title2).padding(.horizontal,8)
            Spacer()
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity).background(.back).cornerRadius(16).padding(16)
    }
}
func getImcResult(result:Double)->(String,String,Color){
    let title:String
    let description:String
    let color:Color
    
    switch result{
    case 0.00..<20:
        title="peso bajo"
        description="estas por debajo del peso recomendado por el IMC"
        color=Color.red
    case 20.00..<24.99:
        title="peso normal"
        description=" estas en el peso recomendado por el IMC"
        color=Color.green
    case 25.00..<29.99:
        title="sobrepeso"
        description="estas por encima del peso recomendado por el IMC"
        color=Color.orange
    case 30.00..<100:
        title="obesidad"
        description="estas muy por encima del peso recomendado por el IMC"
        color=Color.red
        
    default:
        title="ERROR"
        description="ha ocurrido un error"
        color=Color.red
    }
    return (title,description,color)
}
#Preview {
    IMCResult(userWeight: 70, userHeight: 174)
}
