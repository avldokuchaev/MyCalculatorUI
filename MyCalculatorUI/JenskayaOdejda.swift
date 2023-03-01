//
//  JenskayaOdejda.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Женская одежда

struct JenskayaOdejda: View {
    
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
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
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
                        NavigationRasmerOdejdiDlyaVzroslih()
                }
                    
                    Spacer()
                    
                }
                 
                Spacer()
 //_______________________________________________
                
                Text("Соответствие размеров женской одежды")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Выберите размер")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    Picker("Выберите размер", selection: $selected, content: {
                        Text("XS").tag(0)
                        Text("S").tag(1)
                        Text("M").tag(2)
                        Text("L").tag(3)
                        Text("XL").tag(4)
                    })
                     .pickerStyle(.segmented)
                     .background(Color.teal)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.resultText = "Российский размер: " + "42\n" + "Обхват талии: " + "63.5 см.\n" + "Обхват груди: " + "78.7 - 81.3 см.\n" + "Обхват бедер: " + "88.9 см."
                       
                        case 1:
                            self.resultText = "Российский размер: " + "44 - 46\n" + "Обхват талии: " + "66 - 68.6 см.\n" + "Обхват груди: " + "83.8 - 86.4 см.\n" + "Обхват бедер: " + "91.4 - 94 см."
                        case 2:
                            self.resultText = "Российский размер: " + "46 - 48\n" + "Обхват талии: " + "71.1 - 73.7 см.\n" + "Обхват груди: " + "88.9 - 91.4 см.\n" + "Обхват бедер: " + "96.5 - 99.1 см."
                        case 3:
                            self.resultText = "Российский размер: " + "48 - 50\n" + "Обхват талии: " + "76.2 - 80 см.\n" + "Обхват груди: " + "94 - 96.5 см.\n" + "Обхват бедер: " + "101.6 - 105.4 см."
                        case 4:
                            self.resultText = "Российский размер: " + "52 - 54\n" + "Обхват талии: " + "83.8 - 87.6 см.\n" + "Обхват груди: " + "100.3 - 105.4 см.\n" + "Обхват бедер: " + "109.2 - 113 см."
                        
                        default:
                            break
                            
                            
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
                
                
         
 //__________________________________________________
                
                
            }
        }
        
   }
     
}

struct JenskayaOdejda_Previews: PreviewProvider {
    static var previews: some View {
        JenskayaOdejda().previewDevice("iPhone SE (2nd generation)")
    }
}
