//
//  PodrostkovayaObuv.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Подростковая обувь

struct PodrostkovayaObuv: View {
    
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
                
                Text("Подростковая обувь (от 7 до 10 лет)")
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
                       
                        Text("32").tag(0)
                        Text("33").tag(1)
                        Text("34").tag(2)
                        Text("35").tag(3)
                        Text("36").tag(4)
                        Text("37").tag(5)
                        Text("38").tag(6)
                        Text("39").tag(7)
                       
                    })
                     .pickerStyle(.inline)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.rasmerStopi = "19.7"
                        case 1:
                            self.rasmerStopi = "20.3–20.6"
                        case 2:
                            self.rasmerStopi = "21–21.6"
                        case 3:
                            self.rasmerStopi = "21.9"
                        case 4:
                            self.rasmerStopi = "22.2–22.9"
                        case 5:
                            self.rasmerStopi = "23.2-23.5"
                        case 6:
                            self.rasmerStopi = "24.1–24.4"
                        case 7:
                            self.rasmerStopi = "24.8"
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

struct PodrostkovayaObuv_Previews: PreviewProvider {
    static var previews: some View {
        PodrostkovayaObuv().previewDevice("iPhone SE (2nd generation)")
    }
}
