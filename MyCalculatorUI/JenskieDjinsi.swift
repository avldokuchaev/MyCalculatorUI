//
//  JenskieDjinsi.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Женские джинсы

struct JenskieDjinsi: View {
    
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
                
                Text("Соответствие размеров женских джинсов")
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
                        Text("25").tag(0)
                        Text("26").tag(1)
                        Text("27").tag(2)
                        Text("28").tag(3)
                        Text("29").tag(4)
                        Text("29-30").tag(5)
                        Text("30-31").tag(6)
                        Text("32").tag(7)
                        Text("34").tag(8)
                    })
                     .pickerStyle(.inline)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.resultText = "Российский размер: " + "42\n" + "Обхват талии: " + "63.5 см.\n" + "Обхват бедер: " + "88.9 см."
                       
                        case 1:
                            self.resultText = "Российский размер: " + "42 - 44\n" + "Обхват талии: " + "66 см.\n" + "Обхват бедер: " + "91.4 см."
                        case 2:
                            self.resultText = "Российский размер: " + "44 - 46\n" + "Обхват талии: " + "68.6 см.\n" + "Обхват бедер: " + "94 см."
                        case 3:
                            self.resultText = "Российский размер: " + "46\n" + "Обхват талии: " + "71.1 см.\n" + "Обхват бедер: " + "96.5 см."
                        case 4:
                            self.resultText = "Российский размер: " + "46 - 48\n" + "Обхват талии: " + "73.7 см.\n" + "Обхват бедер: " + "99.1 см."
                            
                        case 5:
                            self.resultText = "Российский размер: " + "48\n" + "Обхват талии: " + "76.2 см.\n" + "Обхват бедер: " + "101.6 см."
                        case 6:
                            self.resultText = "Российский размер: " + "50\n" + "Обхват талии: " + "80 см.\n" + "Обхват бедер: " + "105.4 см."
                        case 7:
                            self.resultText = "Российский размер: " + "52\n" + "Обхват талии: " + "83.8 см.\n" + "Обхват бедер: " + "109.2 см."
                        case 8:
                            self.resultText = "Российский размер: " + "54\n" + "Обхват талии: " + "87.6 см.\n" + "Обхват бедер: " + "113 см."
                        
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

struct JenskieDjinsi_Previews: PreviewProvider {
    static var previews: some View {
        JenskieDjinsi().previewDevice("iPhone SE (2nd generation)")
    }
}
