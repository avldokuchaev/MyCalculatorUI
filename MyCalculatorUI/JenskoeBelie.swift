//
//  JenskoeBelie.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Женское белье

struct JenskoeBelie: View {
    
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
                
                Text("Соответствие размеров женского белья")
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
                        Text("XXS").tag(0)
                        Text("XS").tag(1)
                        Text("S").tag(2)
                        Text("M").tag(3)
                        Text("L").tag(4)
                        Text("XL").tag(5)
                        Text("XXL").tag(6)
                        Text("XXXL").tag(7)
                    })
                     .pickerStyle(.segmented)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.resultText = "Российский размер: " + "42\n" + "Обхват талии: " + "63 – 65 см.\n" + "Обхват бедер: " + "89 – 92 см."
                       
                        case 1:
                            self.resultText = "Российский размер: " + "44\n" + "Обхват талии: " + "66 – 69 см.\n" + "Обхват бедер: " + "93 – 96 см."
                        case 2:
                            self.resultText = "Российский размер: " + "46\n" + "Обхват талии: " + "70 – 74 см.\n" + "Обхват бедер: " + "97 – 101 см."
                        case 3:
                            self.resultText = "Российский размер: " + "48\n" + "Обхват талии: " + "75 – 78 см.\n" + "Обхват бедер: " + "102 – 104 см."
                        case 4:
                            self.resultText = "Российский размер: " + "50\n" + "Обхват талии: " + "79 – 83 см.\n" + "Обхват бедер: " + "105 – 108 см."
                            
                        case 5:
                            self.resultText = "Российский размер: " + "52\n" + "Обхват талии: " + "84 – 89 см.\n" + "Обхват бедер: " + "109 – 112 см."
                        case 6:
                            self.resultText = "Российский размер: " + "54\n" + "Обхват талии: " + "90 – 94 см.\n" + "Обхват бедер: " + "113 – 117 см."
                        case 7:
                            self.resultText = "Российский размер: " + "56\n" + "Обхват талии: " + "90 – 94 см.\n" + "Обхват бедер: " + "118 – 122 см."
                        
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

struct JenskoeBelie_Previews: PreviewProvider {
    static var previews: some View {
        JenskoeBelie().previewDevice("iPhone SE (2nd generation)")
    }
}
