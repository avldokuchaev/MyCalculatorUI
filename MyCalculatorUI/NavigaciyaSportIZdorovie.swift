//
//  NavigaciyaSportIZdorovie.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//
//Навигация спорт и здоровье

import SwiftUI

struct NavigaciyaSportIZdorovie: View {
    
    @State private var showsDetailViewController: Bool = false
    @State private var showsDetailViewController1: Bool = false
    @State private var showsDetailViewController2: Bool = false
    @State private var showsDetailViewController3: Bool = false
    @State private var showsDetailViewController4: Bool = false
    @State private var showsDetailViewController5: Bool = false
    @State private var showsDetailViewController6: Bool = false
    @State private var showsDetailViewController7: Bool = false
    @State private var showsDetailViewController8: Bool = false
    
    private let imag = images.randomElement()
   
   struct BunnerButton: ButtonStyle {
       let img: Image
      
       func makeBody(configuration: Configuration) -> some View {
           configuration.label
           img
           .renderingMode(.original)
           .frame(width: 300, height: 38)
       }
       
   }
    
    var body: some View {
        
        ZStack {
            
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
            
            VStack {
                
                Button("") {
                    UIApplication.shared.open(URL(string: imag!["url"]!)!)
                }
                .buttonStyle(BunnerButton(img: Image(imag!["image"]!)))
                .background(.yellow)
                
                HStack {
                    Button("Главное меню") {
                        showsDetailViewController.toggle()
                    }
                    .foregroundColor(.blue)
                    .padding(.leading, 10.0)
                    .sheet(isPresented: $showsDetailViewController) {
                        NavigationMain()
                }
                    
                    Spacer()
                    
                }
                 
                Spacer()
                
                
                    Text("Спорт и здоровье")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.green)
                    
                    
                
                VStack {
                    
                    Button("Калькулятор индекса массы тела (ИМТ)") {
                        showsDetailViewController1.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController1) {
                        CalculatoIndexaMassiTela()
                    }
                    
                    Spacer()
                    
                    Button("Калькулятор площади поверхности тела") {
                        showsDetailViewController2.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController2) {
                        CalculatorPloshadiPoverhnostiTela()
                    }
                    
                    Spacer()
                    
                    Button("Калькулятор калорий") {
                        showsDetailViewController3.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController3) {
                        CalculatorKalorii()
                    }
                    
                    Spacer()
                    
                    Button("Калькулятор идеального веса") {
                        showsDetailViewController4.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController4) {
                        CalculatorIdealnogoVesa()
                    }
                    
                    Spacer()
                    
                    Button("Калькулятор полного максимума штанги") {
                        showsDetailViewController5.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController5) {
                        CalculatorPolnogoMaksimuma()
                    }
                    
                    Spacer()
                    
                    
                }
                
                VStack {
                    
                    Button("Калькулятор повторений") {
                        showsDetailViewController6.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController6) {
                        CalculatorPovtorenii()
                    }
                    
                    Spacer()
                    
                    
                    Button("Калькулятор рабочего веса") {
                        showsDetailViewController7.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController7) {
                        CalculatorRabochegoVesa()
                    }
                    
                    Spacer()
                   
                }
                
                Group {
                    
                    Button("Предполагаемая дата родов") {
                        showsDetailViewController8.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController8) {
                        PredpolagaemayaDataRodov()
                    }
                    
                    Spacer()
                    
                }
                    
                }
                
            
//__________________________________________________
                
                
            }
        }
        
   }
     
}

struct NavigaciyaSportIZdorovie_Previews: PreviewProvider {
    static var previews: some View {
        NavigaciyaSportIZdorovie().previewDevice("iPhone SE (2nd generation)")
    }
}
