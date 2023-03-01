//
//  CalculatorRabochegoVesa.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Калькулятор рабочего веса

struct CalculatorRabochegoVesa: View {
    
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
    
    @State private var kolPovt1: String = ""
    
    @State private var polMaksimum1: String = ""
    
    @State private var resultText: String = ""
    
    @State private var kolPovt2: Double = 0
    
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
                
                Text("Калькулятор рабочего веса")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Введите полный максимум в кг")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                        
                    
                    Spacer()
                    
                    TextField("80", text: $polMaksimum1)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                    Text("Введите количество повторений")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                }
                
                VStack {
                    
                    TextField("10", text: $kolPovt1)
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
                        
                        if self.kolPovt1 == "" || self.polMaksimum1 == "" {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                        
                            self.kolPovt2 = (1.013 - (0.0267123 * Double(self.kolPovt1)!)) * Double(self.polMaksimum1)!
                                
                            self.resultText = "Рабочий вес штанги: " + String(format: "%.0f", kolPovt2) + " кг."
                            
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

struct CalculatorRabochegoVesa_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorRabochegoVesa().previewDevice("iPhone SE (2nd generation)")
    }
}

