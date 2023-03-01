//
//  DetskayaObuvOtOdnogoGodaDoShestiLet.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Детская обувь от 1 до 6 лет

struct DetskayaObuvOtOdnogoGodaDoShestiLet: View {
    
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
    
    @State private var selected = 0
    
    @State private var resultText = ""
    
    @State private var rasmerStopi:String = ""
    
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
                        NavigaciyaDetskayaOdejda()
                }
                    
                    Spacer()
                    
                }
                 
                Spacer()
 //_______________________________________________
                
                Text("Детская обувь (от 1 до 6 лет)")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Выберите Европейский размер")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    Picker("Выберите размер", selection: $selected, content: {
                        Group {
                        Text("21").tag(0)
                        Text("22").tag(1)
                        Text("23").tag(2)
                        Text("24").tag(3)
                        Text("25").tag(4)
                        Text("26").tag(5)
                        Text("27").tag(6)
                        Text("28").tag(7)
                        }
                        Text("29").tag(8)
                        Text("30").tag(9)
                        Text("31").tag(10)
                        
                    })
                     .pickerStyle(.inline)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.rasmerStopi = "12.7"
                        case 1:
                            self.rasmerStopi = "13–13.3"
                        case 2:
                            self.rasmerStopi = "14–14.3"
                        case 3:
                            self.rasmerStopi = "14.6"
                        case 4:
                            self.rasmerStopi = "15.2–15.6"
                        case 5:
                            self.rasmerStopi = "15.9"
                        case 6:
                            self.rasmerStopi = "16.5–16.8"
                        case 7:
                            self.rasmerStopi = "17.1"
                        case 8:
                            self.rasmerStopi = "17.8"
                        case 9:
                            self.rasmerStopi = "18.1–18.4"
                        case 10:
                            self.rasmerStopi = "19.1–19.4"
                        default:
                            break
                            
                            
                        }
                        
                        self.resultText = "Размер стопы: " + rasmerStopi + " см."
                        
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
         
 //__________________________________________________
                
                
            }
        }
        
   }
     
}

struct DetskayaObuvOtOdnogoGodaDoShestiLet_Previews: PreviewProvider {
    static var previews: some View {
        DetskayaObuvOtOdnogoGodaDoShestiLet().previewDevice("iPhone SE (2nd generation)")
    }
}
