//
//  MujskieSorochkiPoVorotnichku.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Мужские сорочки по воротнику

struct MujskieSorochkiPoVorotnichku: View {
    
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
    
    @State private var razmerRubashki = ""
    
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
                
                Text("Мужские сорочки по номеру воротничка")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Выберите номер воротничка")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    Picker("Выберите размер", selection: $selected, content: {
                        
                        Text("S (37-38)").tag(0)
                        Text("M (39-40)").tag(1)
                        Text("L (41-42)").tag(2)
                        Text("XL (43-44)").tag(3)
                        Text("XXL (45-46)").tag(4)
                        Text("XXXL (47-48)").tag(5)
                        
                    })
                     .pickerStyle(.inline)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.razmerRubashki = "44-46"
                        case 1:
                            self.razmerRubashki = "48"
                        case 2:
                            self.razmerRubashki = "50-52"
                        case 3:
                            self.razmerRubashki = "54"
                        case 4:
                            self.razmerRubashki = "56"
                        case 5:
                            self.razmerRubashki = "58-62"
                        
                        default:
                            break
                            
                            
                        }
                        
                        self.resultText = "Размер рубашки: " + razmerRubashki
                        
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

struct MujskieSorochkiPoVorotnichku_Previews: PreviewProvider {
    static var previews: some View {
        MujskieSorochkiPoVorotnichku().previewDevice("iPhone SE (2nd generation)")
    }
}
