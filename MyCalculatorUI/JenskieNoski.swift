//
//  JenskieNoski.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Женские носки

struct JenskieNoski: View {
    
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
                
                Text("Соответствие размеров женских носков")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Выберите Российский размер")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    Picker("Выберите размер", selection: $selected, content: {
                        Text("23").tag(0)
                        Text("25").tag(1)
                        Text("27").tag(2)
                        Text("29").tag(3)
                        Text("31").tag(4)
                    })
                     .pickerStyle(.segmented)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.resultText = "Европейский размер: 37/38"
                       
                        case 1:
                            self.resultText = "Европейский размер: 39/40"
                        case 2:
                            self.resultText = "Европейский размер: 41/42"
                        case 3:
                            self.resultText = "Европейский размер: 43/44"
                        case 4:
                            self.resultText = "Европейский размер: 45/46"
                        
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

struct JenskieNoski_Previews: PreviewProvider {
    static var previews: some View {
        JenskieNoski().previewDevice("iPhone SE (2nd generation)")
    }
}
