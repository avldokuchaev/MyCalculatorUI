//
//  DetskayaOdejdaDoSemiLet.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Детская одежда до 7 лет

struct DetskayaOdejdaDoSemiLet: View {
    
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
    @State private var dlinaSpini:String = ""
    
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
                
                Text("Соответствие размеров одежды для детей от рождения до 7 лет")
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
                        Group {
                        Text("50").tag(0)
                        Text("56").tag(1)
                        Text("62").tag(2)
                        Text("68").tag(3)
                        Text("74").tag(4)
                        Text("80").tag(5)
                        Text("86").tag(6)
                        Text("92").tag(7)
                        }
                        Text("98").tag(8)
                        Text("104").tag(9)
                        Text("110").tag(10)
                        Text("116").tag(11)
                        Text("122").tag(12)
                        Text("128").tag(13)
                        Text("134").tag(14)
                        Text("140").tag(15)
                        
                    })
                     .pickerStyle(.inline)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                    
                    Spacer()
                    
                    Button("Результат") {
                      
                        switch selected {
                            
                        case 0:
                            self.obhvatTalii = "41"
                            self.obhvatBeder = "41"
                            self.rostRebenka = "40-50"
                            self.obhvatGrudi = "41"
                            self.dlinaSpini = "14.5"
                       
                        case 1:
                            self.obhvatTalii = "42"
                            self.obhvatBeder = "44"
                            self.rostRebenka = "51-56"
                            self.obhvatGrudi = "42"
                            self.dlinaSpini = "16"
                        case 2:
                            self.obhvatTalii = "44"
                            self.obhvatBeder = "46"
                            self.rostRebenka = "57-62"
                            self.obhvatGrudi = "44"
                            self.dlinaSpini = "17.5"
                        case 3:
                            self.obhvatTalii = "46"
                            self.obhvatBeder = "48"
                            self.rostRebenka = "63-68"
                            self.obhvatGrudi = "46"
                            self.dlinaSpini = "19"
                        case 4:
                            self.obhvatTalii = "47"
                            self.obhvatBeder = "50"
                            self.rostRebenka = "69-74"
                            self.obhvatGrudi = "48"
                            self.dlinaSpini = "20"
                        case 5:
                            self.obhvatTalii = "49"
                            self.obhvatBeder = "52"
                            self.rostRebenka = "75-80"
                            self.obhvatGrudi = "50"
                            self.dlinaSpini = "21.5"
                        case 6:
                            self.obhvatTalii = "50"
                            self.obhvatBeder = "54"
                            self.rostRebenka = "81-86"
                            self.obhvatGrudi = "51.5"
                            self.dlinaSpini = "22.5"
                        case 7:
                            self.obhvatTalii = "51"
                            self.obhvatBeder = "56"
                            self.rostRebenka = "87-92"
                            self.obhvatGrudi = "53"
                            self.dlinaSpini = "24"
                        case 8:
                            self.obhvatTalii = "52"
                            self.obhvatBeder = "58"
                            self.rostRebenka = "93-98"
                            self.obhvatGrudi = "55"
                            self.dlinaSpini = "25"
                        case 9:
                            self.obhvatTalii = "53"
                            self.obhvatBeder = "60"
                            self.rostRebenka = "99-104"
                            self.obhvatGrudi = "57"
                            self.dlinaSpini = "26.2"
                        case 10:
                            self.obhvatTalii = "54"
                            self.obhvatBeder = "62"
                            self.rostRebenka = "105-110"
                            self.obhvatGrudi = "59"
                            self.dlinaSpini = "27.5"
                        case 11:
                            self.obhvatTalii = "55"
                            self.obhvatBeder = "64"
                            self.rostRebenka = "111-116"
                            self.obhvatGrudi = "61"
                            self.dlinaSpini = "28.5"
                        case 12:
                            self.obhvatTalii = "56"
                            self.obhvatBeder = "66"
                            self.rostRebenka = "117-122"
                            self.obhvatGrudi = "63"
                            self.dlinaSpini = "30"
                        case 13:
                            self.obhvatTalii = "57"
                            self.obhvatBeder = "68"
                            self.rostRebenka = "123-128"
                            self.obhvatGrudi = "65"
                            self.dlinaSpini = "31"
                        case 14:
                            self.obhvatTalii = "58"
                            self.obhvatBeder = "70"
                            self.rostRebenka = "129-134"
                            self.obhvatGrudi = "67"
                            self.dlinaSpini = "32"
                        case 15:
                            self.obhvatTalii = "60"
                            self.obhvatBeder = "74"
                            self.rostRebenka = "135-140"
                            self.obhvatGrudi = "69(ж), 70(м)"
                            self.dlinaSpini = "33.5(ж), 34(м)"
                        default:
                            break
                            
                            
                        }
                        
                        self.resultText = "Рост ребенка: " + rostRebenka + " см.\n" + "Обхват талии: " + obhvatTalii + " см." + "\n" + "Обхват бедер: " + obhvatBeder + " см.\n" + "Обхват груди: " + obhvatGrudi + " см.\n" + "Длина спины: " + dlinaSpini + " см."
                        
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

struct DetskayaOdejdaDoSemiLet_Previews: PreviewProvider {
    static var previews: some View {
        DetskayaOdejdaDoSemiLet().previewDevice("iPhone SE (2nd generation)")
    }
}

