//
//  MujskayaOdejda.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//
//Мужская одежда

import SwiftUI

struct MujskayaOdejda: View {
    
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
                
                Text("Соответствие размеров мужской одежды")
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
                        Text("44").tag(0)
                        Text("46").tag(1)
                        Text("48").tag(2)
                        Text("50").tag(3)
                        Text("52").tag(4)
                        Text("54").tag(5)
                        Text("56").tag(6)
                        Text("58").tag(7)
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
                            self.resultText = "Международный размер: " + "S\n" + "Обхват талии: " + "71.1 см.\n" + "Обхват груди: " + "86.4 см."
                       
                        case 1:
                            self.resultText = "Международный размер: " + "S\n" + "Обхват талии: " + "73.7 см.\n" + "Обхват груди: " + "91.4 см."
                        case 2:
                            self.resultText = "Международный размер: " + "M\n" + "Обхват талии: " + "76.2 см.\n" + "Обхват груди: " + "96.5 см."
                        case 3:
                            self.resultText = "Международный размер: " + "M\n" + "Обхват талии: " + "83.8 см.\n" + "Обхват груди: " + "101.6 см."
                        case 4:
                            self.resultText = "Международный размер: " + "L\n" + "Обхват талии: " + "86.4 - 91.4 см.\n" + "Обхват груди: " + "106.7 - 111.8 см."
                        case 5:
                            self.resultText = "Международный размер: " + "XL\n" + "Обхват талии: " + "94 - 101.6 см.\n" + "Обхват груди: " + "116.8 - 121.9 см."
                        case 6:
                            self.resultText = "Международный размер: " + "XXL\n" + "Обхват талии: " + "104.1 - 109.2 см.\n" + "Обхват груди: " + "127 - 132.1 см."
                        case 7:
                            self.resultText = "Международный размер: " + "XXXL\n" + "Обхват талии: " + "111.8 - 119.4 см.\n" + "Обхват груди: " + "137.2 - 142.2 см."
                        
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
                
                
                
//-------------------------------------------
            }
        }
        
   }
     
}

struct MujskayaOdejda_Previews: PreviewProvider {
    static var previews: some View {
        MujskayaOdejda().previewDevice("iPhone SE (2nd generation)")
    }
}
