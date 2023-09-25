//
//  AirlineSListView.swift
//  Airlines
//
//  Created by Safrana on 9/21/23.
//

import SwiftUI
import UIKit
import Firebase

struct AirlineListView: View {
    @ObservedObject private var airlineState = AirlineStateHandler()

    @State private var isLoggedOut = false;

    var body: some View {
        HStack {
            NavigationView {
                ScrollView {
                    if let airlines = airlineState.airlines {
                        LazyVStack(alignment: .leading) {
                            GreetingView(label: "\(Auth.auth().currentUser?.email ?? "")")
                            
                            //loading airline list from /v1/airlines
                            ForEach(airlines.indices, id: \.self) { index in
                                let airline = airlines[index]
                                    SingleAirlineCard(airline: airline).onAppear  {
                                        if(airlines.count == (index+1)){
                                            NetworkListner.checkInternetConnection { isConnected in
                                                if isConnected {
                                                    airlineState.loadAirlinesMore(with: .airlines, offset: String(index+1))
                                                }
                                            }
                                        }
                                    }
                            }
                        }
                    }else{
                        //error and empty case handling
                        if(airlineState.isLoading == false){
                            if(airlineState.error == nil){
                                EmptyView()
                            }else{
                                ErrorView(error: airlineState.error ?? NSError())
                            }
                        }
                    }
                    
                    //loading state handling
                    LoadingView(isLoading: airlineState.isLoading)
                    
                    //redirect to LoginView if user is guest
                    if isLoggedOut {
                        NavigationLink(
                            destination: LoginView(),
                            isActive: $isLoggedOut,
                            label: { LoginView() }
                        )
                        .hidden()
                    }
                }.onAppear{
                    //should not allow guest users
                    if(UserDefaults.standard.bool(forKey: "isLoggedIn") == false){
                        isLoggedOut = true
                    }else{
                        NetworkListner.checkInternetConnection { isConnected in
                            if isConnected {
                                self.airlineState.loadAirlines(with: .airlines, offset: Config.offsetDefault)
                            }
                        }
                    }
                }.navigationBarTitle(Strings.appName)
                    .navigationBarItems(
                        //logout button
                        trailing: Button(action: {
                            do {
                                try Auth.auth().signOut()
                                isLoggedOut = true
                                
                                //caching the login state
                                UserDefaults.standard.set(false, forKey: "isLoggedIn")
                            } catch let error {
                                //TODO: notify to crashlytics
                                print("Error signing out: \(error.localizedDescription)")
                            }
                        }) {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        })
            }
        }.adaptNavigationViewStyle()
        .navigationBarBackButtonHidden(true)
    }
}

struct AirlineListView_Previews: PreviewProvider {
    static var previews: some View {
        AirlineListView()
    }
}
