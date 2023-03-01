//
//  CalculatorAnnuitetniePlateji.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Калькулятор аннуитетные платежи

struct CalculatorAnnuitetniePlateji: View {
    
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
    
    @State private var mesProcentStavka: Double = 0
     
    @State private var chislAnnuitet: Double = 0
     
    @State private var znamenAnnuitet: Double = 0
     
    @State private var koefficientAnnuiteta: Double = 0
    
    @State private var monthPayment: Double = 0
     
    @State private var summaZaVesSrok: Double = 0
     
    @State private var summaPereplati: Double = 0
    
    @State private var monthPayment1: Double = 0
     
    @State private var summaZaVesSrok1: Double = 0
     
    @State private var summaPereplati1: Double = 0
    
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
                
                Text("Кредитный калькулятор с аннуитетными платежами")
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
                            
                            self.mesProcentStavka = (self.procentnayaStavka.doubleValue / 12) / 100
                             
                            self.chislAnnuitet = self.mesProcentStavka * pow((1 + self.mesProcentStavka), self.srokKreditovaniya.doubleValue)
                             
                                                                             self.znamenAnnuitet = pow((1 + self.mesProcentStavka), self.srokKreditovaniya.doubleValue) - 1
                             
                            self.koefficientAnnuiteta = self.chislAnnuitet / self.znamenAnnuitet
                            
                            if Double(self.summaPervonachalnogoVznosa) == 0 {
                                
                                self.monthPayment = self.summaZaima.doubleValue * koefficientAnnuiteta
                                
                                self.summaZaVesSrok = monthPayment * self.srokKreditovaniya.doubleValue
                                
                                self.summaPereplati = monthPayment * self.srokKreditovaniya.doubleValue - self.summaZaima.doubleValue
                                
                                self.resultText = "Сумма ежемесячного платежа: " + String(format: "%.2f", monthPayment) + "\n" + "Сумма, которую вы выплатите за весь срок кредита: " + String(format: "%.2f", summaZaVesSrok) + "\n" + "Сумма переплаты составит: " + String(format: "%.2f", summaPereplati)
                            } else {
                                
                                self.monthPayment1 = (self.summaZaima.doubleValue - self.summaPervonachalnogoVznosa.doubleValue) * self.koefficientAnnuiteta
                                
                                self.summaZaVesSrok1 = monthPayment1 * self.srokKreditovaniya.doubleValue
                                
                                self.summaPereplati1 = monthPayment1 * self.srokKreditovaniya.doubleValue - self.summaZaima.doubleValue
                                
                                
                                self.resultText = "Сумма ежемесячного платежа: " + String(format: "%.2f", monthPayment1) + "\n" + "Сумма, которую вы выплатите за весь срок кредита: " + String(format: "%.2f", summaZaVesSrok1) + "\n" + "Сумма переплаты составит: " + String(format: "%.2f", summaPereplati1)
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
//---------------------------------------------------
                
            }
        }
        
   }
     
}

struct CalculatorAnnuitetniePlateji_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorAnnuitetniePlateji().previewDevice("iPhone SE (2nd generation)")
    }
}
