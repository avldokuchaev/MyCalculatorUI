//
//  CalculatorPolnogoMaksimuma.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Калькулятор полного максимума

struct CalculatorPolnogoMaksimuma: View {
    
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
    
    @State private var vesShtangi1: String = ""
    
    @State private var kolPovtorenii1: String = ""
    
    @State private var resultText: String = ""
    
    @State private var maximVes: Double = 0
    
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
                
                Text("Калькулятор полного максимума штанги")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Введите вес штанги")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                        
                    
                    Spacer()
                    
                    TextField("60", text: $vesShtangi1)
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
                    
                    TextField("10", text: $kolPovtorenii1)
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
                        
                        if self.vesShtangi1 == "" || self.kolPovtorenii1 == "" {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                            
                            
                            self.maximVes = (100 * Double(self.vesShtangi1)!) / (101.3 - 2.67123 * Double(self.kolPovtorenii1)!)
                                
                            self.resultText = "Ваш максимальный вес штанги: " + String(format: "%.0f", maximVes) + " кг."
                            
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

struct CalculatorPolnogoMaksimuma_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorPolnogoMaksimuma().previewDevice("iPhone SE (2nd generation)")
    }
}

