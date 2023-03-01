//
//  MujskoeBelie.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Мужское белье

struct MujskoeBelie: View {
    
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
                
                Text("Соответствие размеров мужского белья")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Выберите международный размер")
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
                        Text("XXL").tag(5)
                        Text("XXXL").tag(6)
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
                            self.resultText = "Российский размер: 44"
                       
                        case 1:
                            self.resultText = "Российский размер: 46"
                        case 2:
                            self.resultText = "Российский размер: 48"
                        case 3:
                            self.resultText = "Российский размер: 50"
                        case 4:
                            self.resultText = "Российский размер: 52"
                        case 5:
                            self.resultText = "Российский размер: 54"
                        case 6:
                            self.resultText = "Российский размер: 56"
                        
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

struct MujskoeBelie_Previews: PreviewProvider {
    static var previews: some View {
        MujskoeBelie().previewDevice("iPhone SE (2nd generation)")
    }
}
