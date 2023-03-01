//
//  JenskayaOdejdaBolshihRazmerov.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Женская одежда больших размеров

struct JenskayaOdejdaBolshihRazmerov: View {
    
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
                
                Text("Соответствие размеров женской одежды больших размеров")
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
                        Text("0X").tag(0)
                        Text("1X").tag(1)
                        Text("2X").tag(2)
                        Text("3X").tag(3)
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
                            self.resultText = "Обхват талии: " + "83.8 - 86.4 см.\n" + "Обхват груди: " + "104.1 - 106.7 см.\n" + "Обхват бедер: " + "106.7 - 109.2 см."
                       
                        case 1:
                            self.resultText = "Обхват талии: " + "88.9 - 94 см.\n" + "Обхват груди: " + "109.2 - 114.3 см.\n" + "Обхват бедер: " + "111.8 - 116.8 см."
                        case 2:
                            self.resultText = "Обхват талии: " + "99.1 - 104.1 см.\n" + "Обхват груди: " + "119.4 - 124.5 см.\n" + "Обхват бедер: " + "121.9 - 127 см."
                        case 3:
                            self.resultText = "Обхват талии: " + "109.2 - 114.3 см.\n" + "Обхват груди: " + "129.5 - 134.6 см.\n" + "Обхват бедер: " + "132.1 - 137.2 см."
                        
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

struct JenskayaOdejdaBolshihRazmerov_Previews: PreviewProvider {
    static var previews: some View {
        JenskayaOdejdaBolshihRazmerov().previewDevice("iPhone SE (2nd generation)")
    }
}
