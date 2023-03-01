//
//  DetskayaObuvDoOdnogoGoda.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Детская обувь до 1 года

struct DetskayaObuvDoOdnogoGoda: View {
    
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
    
    @State private var evropaRasmer: String = ""
    
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
                
                Text("Детская обувь (от 0 до 1 года)")
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
                        
                        Text("16").tag(0)
                        Text("17").tag(1)
                        Text("18").tag(2)
                        Text("19").tag(3)
                        Text("20").tag(4)
                        
                    })
                     .pickerStyle(.segmented)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.evropaRasmer = "8.3-8.9"
                        case 1:
                            self.evropaRasmer = "9.2-9.5"
                        case 2:
                            self.evropaRasmer = "10.2-10.5"
                        case 3:
                            self.evropaRasmer = "10.8-11.4"
                        case 4:
                            self.evropaRasmer = "11.7-12.1"
                        default:
                            break
                           
                            
                        }
                        
                        self.resultText = "Размер стопы: " + evropaRasmer + " см."
                        
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

struct DetskayaObuvDoOdnogoGoda_Previews: PreviewProvider {
    static var previews: some View {
        DetskayaObuvDoOdnogoGoda().previewDevice("iPhone SE (2nd generation)")
    }
}
