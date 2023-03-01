//
//  CalculatorKalorii.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Калькулятор калорий

struct CalculatorKalorii: View {
    
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
    
    @FocusState private var nameIsFocused: Bool
    
    @State private var selected = 0
    
    @State private var selected1 = 0
    
    @State private var heightMass: String = ""
    
    @State private var weightMass: String = ""
    
    @State private var vozrastVGodah: String = ""
    
    @State private var koeffActivnosti: Double = 0
    
    @State private var baseMetable: Double = 0
    
    @State private var resultCalorii: Double = 0
    
    @State private var resultText: String = ""
    
    func squareBody(heightBody: Double, weightBody: Double) -> Double {
        let squareBodyMath = 0.0167 * pow(heightBody, 0.5) * pow(weightBody, 0.5)
        return squareBodyMath
    }
    
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
                        NavigaciyaSportIZdorovie()
                }
                    
                    Spacer()
                    
                }
                 
                Spacer()
                
                
 //__________________________________________________
                
                Text("Калькулятор калорий")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Picker("Выберите пол", selection: $selected, content: {
                        Text("Мужчина").tag(0)
                        Text("Женщина").tag(1)
                        
                    })
                     .pickerStyle(.segmented)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                        
                    
                    Spacer()
                    
                    Text("Введите рост в сантиметрах")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    TextField("160", text: $heightMass)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                    Text("Введите вес в килограммах")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                }
                
                VStack {
                    
                    TextField("70", text: $weightMass)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                    Text("Введите возраст в годах")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    TextField("36", text: $vozrastVGodah)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                    Text("Уровень ежедневной активности")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                    
                    Spacer()
                    
                    Picker("Выберите уровень", selection: $selected1, content: {
                        Text("Для малоподвижных людей, тренировок мало или они отсутствуют").tag(0)
                        Text("Для людей с низкой активностью, легкие тренировки 1-3 раза в неделю или в виде эквивалента другой активности").tag(1)
                        Text("Для умеренно активных людей: физическая работа средней тяжести или регулярные тренировки 3-5 дней в неделю").tag(2)
                        Text("Для очень активных людей: физическая работа полный день или интенсивные тренировки 6-7 раз в неделю").tag(3)
                        Text("Для предельно активных людей: тяжелая физическая работа и интенсивные тренировки/занятия спортом").tag(4)
                        
                    })
                     .pickerStyle(.inline)
                     .cornerRadius(30)
                     .padding(10)
                     .frame(width: 370.0)
                        
                    
                    Spacer()
                    
                    
                    
                }
                
                VStack {
                    
                    Button("Посчитать") {
                        
                        nameIsFocused = false
                        
                        switch selected1 {
                            
                        case 0:
                            self.koeffActivnosti = 1.200
                        case 1:
                            self.koeffActivnosti = 1.375
                        case 2:
                            self.koeffActivnosti = 1.550
                        case 3:
                            self.koeffActivnosti = 1.725
                        case 4:
                            self.koeffActivnosti = 1.900
                        default:
                            break
                        }
                        
                        if self.heightMass == "" || self.weightMass == "" || self.vozrastVGodah == "" {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                            
                            if selected == 0 {
                            
                                self.baseMetable = (9.99 * Double(self.weightMass)!) + (6.25 * Double(self.heightMass)!) - (4.92 * Double(self.vozrastVGodah)!) + 5
                            } else {
                            
                                self.baseMetable = (9.99 * Double(self.weightMass)!) + (6.25 * Double(self.heightMass)!) - (4.92 * Double(self.vozrastVGodah)!) - 161
                            }
                            
                            self.resultCalorii = self.baseMetable * self.koeffActivnosti
                                
                            self.resultText = "Ваша норма калорий: " + String(format: "%.0f", resultCalorii) + " ккал. в сутки"
                            
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
                
            }
            .onTapGesture {
                        hideKeyboard()
                }
 //__________________________________________________
                
                
            }
        }
        
   }
     
}

struct CalculatorKalorii_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorKalorii().previewDevice("iPhone SE (2nd generation)")
    }
}
