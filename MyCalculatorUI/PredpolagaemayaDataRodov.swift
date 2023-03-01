//
//  PredpolagaemayaDataRodov.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Предполагаемая дата родов

struct PredpolagaemayaDataRodov: View {
    
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
    
    @State private var dayLastMenstruation1: String = ""
    
    @State private var monthLastMenstruation1: String = ""
     
    @State private var yearLastMenstruation1: String = ""
    
    @State private var dayLastMenstruation2: Int = 0
    
    @State private var monthLastMenstruation2: String = ""
     
    @State private var yearLastMenstruation2: Int = 0
    
    @State private var formatResultBirthDate1: String = ""
    
    @State private var resultText: String = ""
    
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
                
                Text("Предполагаемая дата родов")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                Text("Формула для расчета взята с сайта Медвестник (https://medvestnik.ru/).")
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.orange)
                
                VStack {
                    
                    Text("Дата первого дня последней менструации")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                        
                    
                    Spacer()
                    
                    HStack {
                        
                        Text("День")
                            .lineLimit(1)
                            .background(.gray)
                        
                        
                        TextField("5", text: $dayLastMenstruation1)
                            .multilineTextAlignment(.center)
                            .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                            .focused($nameIsFocused)
                        
                        
                        Text("Месяц")
                            .lineLimit(1)
                            .background(.gray)
                        
                        
                        TextField("6", text: $monthLastMenstruation1)
                            .multilineTextAlignment(.center)
                            .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                            .focused($nameIsFocused)
                        
                       
                        Group {
                            
                        Text("Год")
                                .lineLimit(1)
                            .background(.gray)
                        
                        
                        TextField("2022", text: $yearLastMenstruation1)
                                .multilineTextAlignment(.center)
                            .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                            .focused($nameIsFocused)
                        
                        
                    }
                    
                    }
                    .frame(width: 370.0, height: 50.0)
                    
                }
                
                
                VStack {
                  
                    
                    Button("Посчитать") {
                        
                        nameIsFocused = false
                        
                        if self.dayLastMenstruation1 == "" || self.monthLastMenstruation1 == "" || self.yearLastMenstruation1 == "" {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                            
                            switch Int(self.monthLastMenstruation1)! {
                            case 1:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " ноября "
                                } else {
                                    self.monthLastMenstruation2 = " октября "
                                }
                            case 2:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " декабря "
                                } else {
                                    self.monthLastMenstruation2 = " ноября "
                                }
                            case 3:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " января "
                                } else {
                                    self.monthLastMenstruation2 = " декабря "
                                }
                            case 4:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " февраля "
                                } else {
                                    self.monthLastMenstruation2 = " января "
                                }
                            case 5:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " марта "
                                } else {
                                    self.monthLastMenstruation2 = " февраля "
                                }
                            case 6:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " апреля "
                                } else {
                                    self.monthLastMenstruation2 = " марта "
                                }
                            case 7:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " мая "
                                } else {
                                    self.monthLastMenstruation2 = " апреля "
                                }
                            case 8:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " июня "
                                } else {
                                    self.monthLastMenstruation2 = " мая "
                                }
                            case 9:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " июля "
                                } else {
                                    self.monthLastMenstruation2 = " июня "
                                }
                            case 10:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " августа "
                                } else {
                                    self.monthLastMenstruation2 = " июля "
                                }
                            case 11:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " сентября "
                                } else {
                                    self.monthLastMenstruation2 = " августа "
                                }
                            case 12:
                                if Int(self.dayLastMenstruation1)! >= 24 {
                                    self.monthLastMenstruation2 = " октября "
                                } else {
                                    self.monthLastMenstruation2 = " сентября "
                                }
                                
                            default:
                                self.monthLastMenstruation2 = " неизвестно "
                            }
                            
                            if Int(self.dayLastMenstruation1)! == 24 && Int(monthLastMenstruation1)! == 5 {
                                self.dayLastMenstruation2 = 3
                            } else if Int(self.dayLastMenstruation1)! == 24 && Int(monthLastMenstruation1)! != 5 {
                                
                                self.dayLastMenstruation2 = 1
                            } else if Int(self.dayLastMenstruation1)! == 23 && Int(monthLastMenstruation1)! == 5 {
                                
                                self.dayLastMenstruation2 = 28
                            } else if Int(self.dayLastMenstruation1)! == 22 && Int(monthLastMenstruation1)! == 5 {
                                
                                self.dayLastMenstruation2 = 27
                            } else if Int(self.dayLastMenstruation1)! == 25 {
                                
                                self.dayLastMenstruation2 = 1
                            } else if Int(self.dayLastMenstruation1)! == 26 {
                                
                                self.dayLastMenstruation2 = 2
                            } else if Int(self.dayLastMenstruation1)! == 27 {
                                
                                self.dayLastMenstruation2 = 3
                            } else if Int(self.dayLastMenstruation1)! == 28 {
                                
                                self.dayLastMenstruation2 = 4
                            } else if Int(self.dayLastMenstruation1)! == 29 {
                                
                                self.dayLastMenstruation2 = 5
                            } else if Int(self.dayLastMenstruation1)! == 30 {
                                
                                self.dayLastMenstruation2 = 6
                            } else if Int(self.dayLastMenstruation1)! == 31 {
                                
                                self.dayLastMenstruation2 = 7
                            } else {
                                self.dayLastMenstruation2 = Int(self.dayLastMenstruation1)! + 7
                            }
                            
                            if Int(monthLastMenstruation1)! <= 3 {
                            
                                self.yearLastMenstruation2 = Int(self.yearLastMenstruation1)!
                            } else {
                                self.yearLastMenstruation2 = Int(self.yearLastMenstruation1)! + 1
                            }
                            self.formatResultBirthDate1 = "Предполагаемая дата родов: " + String(dayLastMenstruation2) + monthLastMenstruation2 + String(yearLastMenstruation2) + " г."
                                
                            self.resultText = formatResultBirthDate1
                            
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

struct PredpolagaemayaDataRodov_Previews: PreviewProvider {
    static var previews: some View {
        PredpolagaemayaDataRodov().previewDevice("iPhone SE (2nd generation)")
    }
}
