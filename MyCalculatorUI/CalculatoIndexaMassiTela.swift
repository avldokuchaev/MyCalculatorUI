//
//  CalculatoIndexaMassiTela.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Калькулятор индекса массы тела

struct CalculatoIndexaMassiTela: View {
    
    @State private var showsDetailViewController = false
    
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
    
    @FocusState private var nameIsFocused: Bool
    
    @State private var heightMassIndex: String = ""
    
    @State private var weightMassIndex: String = ""
    
    @State private var resultText: String = ""
    
    @State private var resultIndexMassBody: Double = 0
     
    @State private var indexBodyRuss: String = ""
     
    @State private var metrIndexMass: String = ""
    
    @State private var formatResultIndexBody: String = ""
    
    func indexBody(heightBody: Double, weightBody: Double) -> Double {
        let heightBodyMeter = heightBody / 100
        let indexBodyMath = weightBody / pow(heightBodyMeter, 2)
        return indexBodyMath
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
                    Button("В меню") {
                        showsDetailViewController.toggle()
                    }
                    .foregroundColor(.blue)
                    .padding(.leading, 10.0)
                    .sheet(isPresented: $showsDetailViewController) {
                        NavigaciyaSportIZdorovie()
                }
                    
                    Spacer()
                    
                }
                 
                Spacer()
                
                
 //__________________________________________________
                
                Text("Калькулятор индекса массы тела (ИМТ)")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Введите рост в сантиметрах")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                        
                    
                    Spacer()
                    
                    TextField("160", text: $heightMassIndex)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                    Text("Введите вес в килограммах")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                }
                
                VStack {
                    
                    TextField("70", text: $weightMassIndex)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                    
                    
                }
                
                VStack {
                    
                    Button("Посчитать") {
                        
                        nameIsFocused = false
                        
                        if self.heightMassIndex == "" || self.weightMassIndex == "" {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                            
                            
                            self.resultIndexMassBody = indexBody(heightBody: Double(self.heightMassIndex)!, weightBody: Double(self.weightMassIndex)!)
                             
                            self.indexBodyRuss = "Индекс массы тела: "
                            self.metrIndexMass = " кг/м2"
                          
                            self.formatResultIndexBody = indexBodyRuss + String(format: "%.1f", resultIndexMassBody) + metrIndexMass
                                
                            self.resultText = formatResultIndexBody
                            
                        }
                        
                    }
                    .padding(10)
                    .frame(width: 300.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    
                    
                    Spacer()
                    
                    Text ("\(resultText)")
                        .fontWeight(.bold)
                        .padding(10)
                        .frame(width: 370.0)
                        
                        
                    
                    Spacer()
                    
                }
                
            }
            .onTapGesture {
                        hideKeyboard()
                }
//__________________________________________________
                
                
            }
        }
        
   }
     
}

struct CalculatoIndexaMassiTela_Previews: PreviewProvider {
    static var previews: some View {
        CalculatoIndexaMassiTela().previewDevice("iPhone SE (2nd generation)")
    }
}

