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
    @State var showAlert = false
    
    var body: some View {
        VStack {
            VStack{
                Text("\(balance)")
                    .font(.system(size: 30, weight: .semibold))
                    .padding(.bottom, 50)
                Text("Введите и нажмите ОК, чтобы добавить. Для того, чтобы внести расход введите число с минусом.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .opacity(0.6)
                    .padding(.horizontal, 50)
            }
            .padding(.bottom, 50)
            .padding(.top, 160)
            HStack {
                TextField("Введите..", text: $amountNew)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 24))
                    .keyboardType(.numberPad)
                    .padding(.trailing, 15)
                Button(action: {
                    balance_update()
                }, label: {
                    Text("OK")
                        .font(.headline)
                        .frame(width: 40, height: 35)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(4)
                        .shadow(color: Color.blue.opacity(0.3), radius: 7, x: 0, y: 3)
                })
            }
            .padding(.horizontal, 40)
            Spacer()
        }
    }
    func balance_update() {
        if amountNew.isEmpty {
            amountNew = "Пусто..."
        } else {
            balance += Int(amountNew)!
            amountNew = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
