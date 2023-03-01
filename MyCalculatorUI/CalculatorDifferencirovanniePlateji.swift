//
//  CalculatorDifferencirovanniePlateji.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Калькулятор дифференцированные платежи

struct CalculatorDifferencirovanniePlateji: View {
    
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
    
    @State private var summaZaima: String = ""
    
    @State private var srokKreditovaniya: String = ""
    
    @State private var summaPervonachalnogoVznosa: String = ""
    
    @State private var procentnayaStavka: String = ""
    
    @State private var resultText: String = ""
    
    @State private var chastOsnovnDolga: Double = 0
     
    @State private var summaProcentov: Double = 0
     
    @State private var summaPlategaVMesyac: Double = 0
    
    @State private var summaZaimaMinusVznos: Double = 0
     
    @State private var chastOsnovnDolgaMinusVznos: Double = 0
    
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
                
                Text("Кредитный калькулятор с дифференцированными платежами")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    HStack {
                    
                    Text("Введите сумму займа")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 185.0)
                        .background(.gray)
                        
                    
                    Spacer()
                    
                    TextField("10000", text: $summaZaima)
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
                    
                    Text("Введите срок кредитования в месяцах")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 185.0)
                        .background(.gray)
                    
                    TextField("36", text: $srokKreditovaniya)
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
                    
                    HStack {
                    
                    Text("Введите сумму первоначального взноса, иначе 0")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 185.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    TextField("0", text: $summaPervonachalnogoVznosa)
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
                        
                        if self.summaZaima == "" || self.srokKreditovaniya == ""  || self.procentnayaStavka == ""   || self.summaPervonachalnogoVznosa == ""  {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                            
                            self.chastOsnovnDolga = self.summaZaima.doubleValue / self.srokKreditovaniya.doubleValue
                            
                            if Double(self.summaPervonachalnogoVznosa) == 0 {
                                
                                self.summaProcentov = self.summaZaima.doubleValue * (self.procentnayaStavka.doubleValue / 100) * 30 / 365
                                    
                                self.summaPlategaVMesyac = chastOsnovnDolga + summaProcentov
                                
                                self.resultText = "Сумма платежа в следующем месяце: " + String(format: "%.2f", summaPlategaVMesyac)
                            } else {
                                
                                self.summaZaimaMinusVznos = self.summaZaima.doubleValue - summaPervonachalnogoVznosa.doubleValue
                                
                                self.chastOsnovnDolgaMinusVznos = summaZaimaMinusVznos / self.srokKreditovaniya.doubleValue
                                
                                self.summaProcentov = summaZaimaMinusVznos * (self.procentnayaStavka.doubleValue / 100) * 30 / 365
                                
                                self.summaPlategaVMesyac = chastOsnovnDolgaMinusVznos + summaProcentov
                                
                                self.resultText = "Сумма платежа в следующем месяце: " + String(format: "%.2f", summaPlategaVMesyac)
                            }
                            
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

struct CalculatorDifferencirovanniePlateji_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorDifferencirovanniePlateji().previewDevice("iPhone SE (2nd generation)")
    }
}
