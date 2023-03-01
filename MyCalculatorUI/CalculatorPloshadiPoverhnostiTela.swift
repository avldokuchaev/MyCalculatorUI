//
//  CalculatorPloshadiPoverhnostiTela.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Калькулятор площади поверхности тела

struct CalculatorPloshadiPoverhnostiTela: View {
    
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
    
    @State private var heightMass: String = ""
    
    @State private var weightMass: String = ""
    
    @State private var resultText: String = ""
    
    @State private var resultSquareBody: Double = 0
     
    @State private var squareBodyRuss: String = ""
     
    @State private var metrSqare: String = ""
    
    @State private var formatResultSquareBody: String = ""
    
    func squareBody(heightBody: Double, weightBody: Double) -> Double {
        let squareBodyMath = 0.0167 * pow(heightBody, 0.5) * pow(weightBody, 0.5)
        return squareBodyMath
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
                
                Text("Калькулятор площади поверхности тела")
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
                    
                    TextField("160", text: $heightMass)
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
                    
                    TextField("70", text: $weightMass)
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
                        
                        if self.heightMass == "" || self.weightMass == "" {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                            
                            
                            self.resultSquareBody = squareBody(heightBody: Double(self.heightMass)!, weightBody: Double(self.weightMass)!)
                            self.squareBodyRuss = "Площадь поверхности тела: "
                            self.metrSqare = " кв. м."
                            self.formatResultSquareBody = squareBodyRuss + String(format: "%.2f", resultSquareBody) + metrSqare
                                
                            self.resultText = formatResultSquareBody
                            
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

struct CalculatorPloshadiPoverhnostiTela_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorPloshadiPoverhnostiTela().previewDevice("iPhone SE (2nd generation)")
    }
}
