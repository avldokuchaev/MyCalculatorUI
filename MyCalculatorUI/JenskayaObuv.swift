//
//  JenskayaObuv.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Женская обувь

struct JenskayaObuv: View {
    
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
    
    @State private var rasmerStopi:String = ""
    
    @State private var rossiskiiRasmer:String = ""
    
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
                        NavigationRasmerOdejdiDlyaVzroslih()
                }
                    
                    Spacer()
                    
                }
                 
                Spacer()
 //_______________________________________________
                
                Text("Женская обувь")
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
                        Group {
                        Text("35").tag(0)
                        Text("35.5").tag(1)
                        Text("36").tag(2)
                        Text("36.5").tag(3)
                        Text("37").tag(4)
                        Text("37.5").tag(5)
                        Text("38").tag(6)
                        Text("38.5").tag(7)
                        }
                        Text("39").tag(8)
                        Text("39.5").tag(9)
                        Text("40-41").tag(10)
                        Text("41").tag(11)
                        Text("41-42").tag(12)
                        Text("42").tag(13)
                        Text("42-43").tag(14)
                        
                    })
                     .pickerStyle(.inline)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.rasmerStopi = "21.5"
                            self.rossiskiiRasmer = "34"
                        case 1:
                            self.rasmerStopi = "22"
                            self.rossiskiiRasmer = "34.5"
                        case 2:
                            self.rasmerStopi = "22.5"
                            self.rossiskiiRasmer = "35"
                        case 3:
                            self.rasmerStopi = "23"
                            self.rossiskiiRasmer = "36"
                        case 4:
                            self.rasmerStopi = "23.5"
                            self.rossiskiiRasmer = "36.5"
                        case 5:
                            self.rasmerStopi = "24"
                            self.rossiskiiRasmer = "37"
                        case 6:
                            self.rasmerStopi = "24.5"
                            self.rossiskiiRasmer = "37.5"
                        case 7:
                            self.rasmerStopi = "25"
                            self.rossiskiiRasmer = "38"
                        case 8:
                            self.rasmerStopi = "25.5"
                            self.rossiskiiRasmer = "39"
                        case 9:
                            self.rasmerStopi = "26"
                            self.rossiskiiRasmer = "39.5"
                        case 10:
                            self.rasmerStopi = "26.5"
                            self.rossiskiiRasmer = "40"
                        case 11:
                            self.rasmerStopi = "27"
                            self.rossiskiiRasmer = "41"
                        case 12:
                            self.rasmerStopi = "27.5"
                            self.rossiskiiRasmer = "41.5"
                        case 13:
                            self.rasmerStopi = "28"
                            self.rossiskiiRasmer = "42"
                        case 14:
                            self.rasmerStopi = "28.5"
                            self.rossiskiiRasmer = "42.5"
                        default:
                            break
                            
                            
                        }
                        
                        self.resultText = "Размер стопы: " + rasmerStopi + " см.\n" + "Российский размер: " + rossiskiiRasmer
                        
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

struct JenskayaObuv_Previews: PreviewProvider {
    static var previews: some View {
        JenskayaObuv().previewDevice("iPhone SE (2nd generation)")
    }
}
