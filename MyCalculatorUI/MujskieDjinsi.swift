//
//  MujskieDjinsi.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Мужские джинсы

struct MujskieDjinsi: View {
    
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
    
    @State private var selected1 = 0
    
    @State private var resultText = ""
    
    @State private var perviiRasmerSelected = ""
    
    @State private var vtoroiRasmerSelected = ""
    
    @State private var obhvatTalii = ""
    
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
                
                Text("Соответствие размеров мужских джинсов")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Выберите первый размер")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    Picker("Выберите первый размер", selection: $selected, content: {
                        Group {
                        Text("28").tag(0)
                        Text("29").tag(1)
                        Text("30").tag(2)
                        Text("31").tag(3)
                        Text("32").tag(4)
                        Text("33").tag(5)
                        }
                        Text("34").tag(6)
                        Text("35").tag(7)
                        Text("36").tag(8)
                        Text("37").tag(9)
                        Text("38").tag(10)
                        Text("39").tag(11)
                        Text("40").tag(12)
                        
                    })
                     .pickerStyle(.segmented)
                     .background(Color.teal)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Text("Выберите второй размер")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    Picker("Выберите второй размер", selection: $selected1, content: {
                        
                        Text("28").tag(0)
                        Text("30").tag(1)
                        Text("32").tag(2)
                        Text("34").tag(3)
                        Text("36").tag(4)
                        
                    
                    })
                     .pickerStyle(.segmented)
                     .background(Color.teal)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                }
                
                VStack {
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.perviiRasmerSelected = "42"
                            self.obhvatTalii = "71.1"
                        case 1:
                            self.perviiRasmerSelected = "44"
                            self.obhvatTalii = "73.7"
                        case 2:
                            self.perviiRasmerSelected = "44-46"
                            self.obhvatTalii = "76.2"
                        case 3:
                            self.perviiRasmerSelected = "46-48"
                            self.obhvatTalii = "78.7"
                        case 4:
                            self.perviiRasmerSelected = "48"
                            self.obhvatTalii = "81.3"
                        case 5:
                            self.perviiRasmerSelected = "50"
                            self.obhvatTalii = "83.8"
                        case 6:
                            self.perviiRasmerSelected = "50"
                            self.obhvatTalii = "86.4"
                        case 7:
                            self.perviiRasmerSelected = "50-52"
                            self.obhvatTalii = "88.9"
                        case 8:
                            self.perviiRasmerSelected = "52"
                            self.obhvatTalii = "91.4"
                        case 9:
                            self.perviiRasmerSelected = "52-54"
                            self.obhvatTalii = "94"
                        case 10:
                            self.perviiRasmerSelected = "54"
                            self.obhvatTalii = "96.5"
                        case 11:
                            self.perviiRasmerSelected = "54-56"
                            self.obhvatTalii = "99.1"
                        case 12:
                            self.perviiRasmerSelected = "56"
                            self.obhvatTalii = "101.6"
                        default:
                            break
                            
                        }
                        
                        switch selected1 {
                            
                        case 0:
                            self.vtoroiRasmerSelected = "71.1"
                        case 1:
                            self.vtoroiRasmerSelected = "76.2"
                        case 2:
                            self.vtoroiRasmerSelected = "81.3"
                        case 3:
                            self.vtoroiRasmerSelected = "86.4"
                        case 4:
                            self.vtoroiRasmerSelected = "91.4"
                        default:
                            break
                        }
                        
                        self.resultText = "Российский размер: " + perviiRasmerSelected + "\n" + "Обхват талии: " + obhvatTalii + " см." + "\n" + "Длина по внутреннему шву: " + vtoroiRasmerSelected + " см."
                        
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

struct MujskieDjinsi_Previews: PreviewProvider {
    static var previews: some View {
        MujskieDjinsi().previewDevice("iPhone SE (2nd generation)")
    }
}
