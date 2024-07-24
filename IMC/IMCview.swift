//
//  IMCview.swift
//  IMC
//
//  Created by Juan augusto Roldan on 21/07/2024.
//

import SwiftUI

struct IMCview: View {
    
    
    @State var gender:Int = 0
    @State var height:Double = 150
    @State var age: Int = 18
    @State var weight: Int = 70

    var body: some View {
        VStack{
            HStack{
                ToggleButton(text: "hombre", imageName: "heart.fill", gender: 0,selectedGender:$gender)
            
                ToggleButton(text: "mujer", imageName: "star.fill", gender: 1,selectedGender:$gender)}
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(text: "edad", number: $age)
                CounterButton(text: "peso", number: $weight)
            }
            IMCCalculatorButton(userWeight: Double(weight), userHeight: height)

            
        }.frame(maxWidth:.infinity ,maxHeight: .infinity).background(.backGroundCor)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement:.principal){
                    Text("IMC calculetor").foregroundColor(.white)
                }
            }
            
            
    }
}

struct IMCCalculatorButton: View{
    let userWeight:Double
    let userHeight:Double
    var body: some View{
        NavigationStack{
            NavigationLink(destination:{IMCResult(userWeight: userWeight, userHeight: userHeight)}){
                Text("Calcular").font(.title).bold().foregroundColor(.white).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 100).background(.backGroundCor)
            }
        }
    }
}

struct ToggleButton:View {
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender : Int
    
    var body: some View {
        
        let color = if(gender == selectedGender){
            Color.backGroundSelect
        }else{
            Color.backGroundCor
        }
        
        Button(action:{
            selectedGender = gender
        }){
            VStack{
                Image(systemName:imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                 InformationText(text: text)
                            }.frame(maxWidth: .infinity,maxHeight: .infinity).background(color)
            
        }
    }
}
struct InformationText:View{
    let text:String
    var body:some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleText:View{
    let text:String
    
    var body: some View{
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator:View{
    @Binding var selectedHeight:Double
    var body: some View{
        VStack{
            TitleText(text:"altura")
            InformationText(text: "\(Int(selectedHeight))cm")
            Slider(value:$selectedHeight,  in:100...220,step:1).padding(.horizontal,16)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity).background(.backGroundCor)
    }
}

struct CounterButton : View {
    let text:String
    @Binding var number : Int
    var body: some View {
        VStack{
            TitleText(text: text)
            InformationText(text: String(number))
            HStack{
                Button(action:{
                    if (number > 0){
                        number -= 1
                    }
                    
                }){
                    
                    ZStack{
                        Circle().frame(width: 70,height: 70)
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                    }
                }
                Button(action:{
                    if (number < 120){
                        number += 1
                    }
                    
                }){
                    ZStack{
                        Circle().frame(width: 70,height: 70)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
#Preview {
IMCview()
        
    }
