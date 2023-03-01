//
//  CalculatorVkladaBezKapitalizacii.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Калькулятор вклада без капитализации

struct CalculatorVkladaBezKapitalizacii: View {
    
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
    
    @State private var summaVklada: String = ""
    
    @State private var srokVklada: String = ""
    
    @State private var procentnayaStavka: String = ""
    
    @State private var resultText: String = ""
    
    @State private var srokVkladaMes: Double = 0
     
    @State private var zarabotSummaVGod: Double = 0
     
    @State private var itogovayaSumma: Double = 0
    
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
                        NavigaciyaFinansovieCalculatori()
                }
                    
                    Spacer()
                    
                }
                 
                Spacer()
                
                
 //__________________________________________________
                
                Text("Калькулятор вклада без капитализации")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    HStack {
                    
                    Text("Введите сумму вклада")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 185.0)
                        .background(.gray)
                        
                    
                    Spacer()
                    
                    TextField("10000", text: $summaVklada)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 185.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                        .background(.orange)
                        
                    }
                    .frame(width: 370.0)
                    
                    Spacer()
                    
                }
                
                VStack {
                    
                    HStack {
                    
                    Text("Введите срок вклада в месяцах")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 185.0)
                        .background(.gray)
                    
                    TextField("36", text: $srokVklada)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 185.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                        .background(.orange)
                        
                    }
                    .frame(width: 370.0)
                    
                    Spacer()
                    
                }
                
                VStack {
                    
                    HStack {
                    
                    Text("Введите процентную ставку")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 185.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    TextField("12", text: $procentnayaStavka)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 185.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                        .background(.orange)
                        
                    }
                    .frame(width: 370.0)
                    
                    Spacer()
                        
                }
                
                VStack {
                    
                    Button("Посчитать") {
                        
                        nameIsFocused = false
                        
                        if self.summaVklada == "" || self.srokVklada == ""  || self.procentnayaStavka == "" {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                            
                            self.srokVkladaMes = self.srokVklada.doubleValue * 30.4
                             
                            self.zarabotSummaVGod = (self.summaVklada.doubleValue * self.procentnayaStavka.doubleValue * srokVkladaMes / 365) / 100
                             
                            self.itogovayaSumma = self.zarabotSummaVGod + self.summaVklada.doubleValue
                                
                            self.resultText = "За " + self.srokVklada + " месяцев вы получите сумму: " + String(format: "%.2f", zarabotSummaVGod) + "\n" + "Итоговая сумма составит: " + String(format: "%.2f", itogovayaSumma)
                            
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

struct CalculatorVkladaBezKapitalizacii_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorVkladaBezKapitalizacii().previewDevice("iPhone SE (2nd generation)")
    }
}
