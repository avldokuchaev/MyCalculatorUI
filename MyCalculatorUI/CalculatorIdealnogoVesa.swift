//
//  CalculatorIdealnogoVesa.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Калькулятор идеального веса

struct CalculatorIdealnogoVesa: View {
    
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
    
    @State private var height: String = ""
    
    @State private var vozrastcon: String = ""
    
    @State private var obhvatZapyast: String = ""
    
    @State private var resultText: String = ""
    
    @State private var idealVesRasschet: Double = 0
    
    @State private var koefficientus: Double = 0
    
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
                
                Text("Калькулятор идеального веса")
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
                    
                    TextField("160", text: $height)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                    Text("Введите возраст в годах")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                }
                
                VStack {
                    
                    TextField("40", text: $vozrastcon)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                    Text("Введите обхват запястья в сантиметрах")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                        
                    
                    Spacer()
                    
                    TextField("10", text: $obhvatZapyast)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(.numberPad)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                    
                    
                }
                
                VStack {
                    
                    Button("Посчитать") {
                        
                        nameIsFocused = false
                        
                        if self.height == "" || self.vozrastcon == "" || self.obhvatZapyast == "" {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                            
                            
                            switch Int(self.obhvatZapyast)! {
                                
                            case 0...14:
                                self.koefficientus = 0.9
                            case 15...17:
                                self.koefficientus = 1.0
                            case 17...5000:
                                self.koefficientus = 1.1
                            default:
                                break
                                
                            }
                            
                            self.idealVesRasschet = ((Double(self.height)! - 100) + (Double(self.vozrastcon)! / 10)) * 0.9 * self.koefficientus
                                
                            self.resultText = "Ваш идеальный вес: " + String(format: "%.0f", idealVesRasschet) + " кг."
                            
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

struct CalculatorIdealnogoVesa_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorIdealnogoVesa().previewDevice("iPhone SE (2nd generation)")
    }
}
