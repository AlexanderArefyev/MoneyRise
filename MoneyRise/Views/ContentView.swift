//
//  ContentView.swift
//  MoneyRise
//
//  Created by Александр Арефьев on 18.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var balance = 0
    @State var amountNew = ""
    
    var body: some View {
        VStack {
            VStack{
                Text("\(balance)")
                    .font(.system(size: 30, weight: .semibold))
                    .padding(.bottom, 50)
                Text("Введите сумму и выберете нужное дейсвие, чтобы взаимодействовать с Вашим счетом.\nПриятного пользования!")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .opacity(0.6)
                    .padding(.horizontal, 50)
            }
            .padding(.bottom, 25)
            .padding(.top, 160)
            VStack {
                TextField("Введите..", text: $amountNew)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 24))
                    .keyboardType(.numberPad)
                GeometryReader { geometry in
                    HStack (spacing: 17) {
                        Button(action: {
                            balance_update_minus()
                        }, label: {
                            Text("Расход")
                                .font(.headline)
                                .frame(width: geometry.size.width / 2.1, height: 35)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(5)
                        })
                        Button(action: {
                            balance_update_plus()
                        }, label: {
                            Text("Доход")
                                .font(.headline)
                                .frame(width: geometry.size.width / 2.1, height: 35)
                                .foregroundColor(Color.white)
                                .background(Color.green)
                                .cornerRadius(5)
                        })
                    }
                }
                .padding(.top, 10)
            }
            .padding(.top, 20)
            .padding(.horizontal, 40)
            Spacer()
        }
        
    }
    
    func balance_update_plus() {
        if amountNew.isEmpty {
            amountNew = ""
        } else {
            balance += Int(amountNew)!
            amountNew = ""
        }
    }
    
    func balance_update_minus() {
        if amountNew.isEmpty {
            amountNew = ""
        } else {
            balance -= Int(amountNew)!
            amountNew = ""
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
