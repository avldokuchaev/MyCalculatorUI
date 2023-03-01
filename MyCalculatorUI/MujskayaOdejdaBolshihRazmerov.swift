//
//  MujskayaOdejdaBolshihRazmerov.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Мужская одежда больших размеров

struct MujskayaOdejdaBolshihRazmerov: View {
    
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
//__________________________________________________
                Text("Соответствие размеров мужской одежды больших размеров")
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
                        Text("3XL").tag(0)
                        Text("4XL").tag(1)
                        Text("5XL").tag(2)
                        Text("6XL").tag(3)
                       
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
                            self.resultText = "Обхват груди: " + "137.2 - 142.2 см.\n" + "Обхват талии: " + "111.8 - 119.4 см."
                        case 1:
                            self.resultText = "Обхват груди: " + "142.2 - 152.4 см.\n" + "Обхват талии: " + "121.9 - 129.5 см."
                        case 2:
                            self.resultText = "Обхват груди: " + "157.5 - 162.6 см.\n" + "Обхват талии: " + "132.1 - 139.7 см."
                        case 3:
                            self.resultText = "Обхват груди: " + "167.6 - 172.7 см.\n" + "Обхват талии: " + "142.2 - 147.3 см."
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
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(10)
                        .frame(width: 370.0)
                        
                        
                    
                    Spacer()
             
                    
                }
                
                
                
                
            }
        }
        
   }
     
}

struct MujskayaOdejdaBolshihRazmerov_Previews: PreviewProvider {
    static var previews: some View {
        MujskayaOdejdaBolshihRazmerov().previewDevice("iPhone SE (2nd generation)")
    }
}
