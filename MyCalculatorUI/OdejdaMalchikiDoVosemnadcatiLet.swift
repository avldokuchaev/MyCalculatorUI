//
//  OdejdaMalchikiDoVosemnadcatiLet.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Одежда мальчики до 18 лет

struct OdejdaMalchikiDoVosemnadcatiLet: View {
    
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
    
    @State private var obhvatTalii:String = ""
    @State private var obhvatBeder:String = ""
    @State private var rostRebenka:String = ""
    @State private var obhvatGrudi:String = ""
    
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
                
                Text("Соответствие размеров одежды для мальчиков от 8 до 18 лет")
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
                        
                        Text("152").tag(0)
                        Text("158").tag(1)
                        Text("164").tag(2)
                        Text("170").tag(3)
                        Text("176").tag(4)
                        Text("182").tag(5)
                        Text("188").tag(6)
                        
                    })
                     .pickerStyle(.inline)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.obhvatTalii = "63–67"
                            self.obhvatBeder = "79–82"
                            self.rostRebenka = "147-152"
                            self.obhvatGrudi = "73-77"
                        case 1:
                            self.obhvatTalii = "66–69"
                            self.obhvatBeder = "81–85"
                            self.rostRebenka = "153–158"
                            self.obhvatGrudi = "76–80"
                        case 2:
                            self.obhvatTalii = "68–71"
                            self.obhvatBeder = "84–88"
                            self.rostRebenka = "159–164"
                            self.obhvatGrudi = "79–83"
                        case 3:
                            self.obhvatTalii = "70–73"
                            self.obhvatBeder = "87–91"
                            self.rostRebenka = "165–170"
                            self.obhvatGrudi = "82–86"
                        case 4:
                            self.obhvatTalii = "72–75"
                            self.obhvatBeder = "90–94"
                            self.rostRebenka = "171–176"
                            self.obhvatGrudi = "85–89"
                        case 5:
                            self.obhvatTalii = "74–78"
                            self.obhvatBeder = "93–97"
                            self.rostRebenka = "177–182"
                            self.obhvatGrudi = "88–92"
                        case 6:
                            self.obhvatTalii = "77–81"
                            self.obhvatBeder = "96–100"
                            self.rostRebenka = "183–188"
                            self.obhvatGrudi = "91–95"
                        default:
                            break
                           
                            
                        }
                        
                        self.resultText = "Рост ребенка: " + rostRebenka + " см.\n" + "Обхват талии: " + obhvatTalii + " см." + "\n" + "Обхват бедер: " + obhvatBeder + " см.\n" + "Обхват груди: " + obhvatGrudi + " см."
                        
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

struct OdejdaMalchikiDoVosemnadcatiLet_Previews: PreviewProvider {
    static var previews: some View {
        OdejdaMalchikiDoVosemnadcatiLet().previewDevice("iPhone SE (2nd generation)")
    }
}

