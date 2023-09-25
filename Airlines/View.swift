//
//  View.swift
//  Airlines
//
//  Created by Safrana on 9/23/23.
//


import SwiftUI

extension View {
    func adaptNavigationViewStyle() -> some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        }
        else if UIDevice.current.userInterfaceIdiom == .phone{
            return AnyView(self.navigationViewStyle(DefaultNavigationViewStyle()))
        }else{
            return AnyView(Text("Not suppored for this device!"))
        }

    }
    
    func titleStyle() -> some View {
        padding(0)
            .foregroundColor(AppColors.primaryColor)
            .font(Font.custom("Helvetica", size: 20).weight(.regular))
        }
    
    func subTitleStyle() -> some View {
        padding(0)
            .font(Font.custom("Helvetica", size: 14).weight(.regular))
            .foregroundColor(AppColors.secondaryColor)
            .multilineTextAlignment(.leading)
        }
    
    func labelStyle() -> some View {
        padding(0)
            .font(Font.custom("Helvetica", size: Dimension.labelFont).weight(.regular))
            .foregroundColor(AppColors.secondaryColor)
            .multilineTextAlignment(.leading)
        }
    
    func labelBoldStyle() -> some View {
        padding(0)
            .font(Font.custom("Helvetica", size: Dimension.labelFont).weight(.bold))
            .foregroundColor(AppColors.secondaryColor)
            .multilineTextAlignment(.leading)
        }
    
    func bodyTitleStyle() -> some View {
        padding(0)
            .foregroundColor(AppColors.primaryColor)
            .font(Font.custom("Helvetica", size: 16).weight(.regular))
        }
    
    func cardLayoutStyle() -> some View {
        padding(0)
            .background(
             RoundedRectangle(cornerRadius: 10, style: .continuous)
                 .fill(Color(hex: "#eef1f5"))
            )
            .padding(.leading, Dimension.spacePadding)
            .padding(.trailing, Dimension.spacePadding)
        }
    
    func badgeStyle(status: String) -> some View {
        padding(6)
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(AppColors.statusBadgeColor(status: status))
            ).foregroundColor(Color.white)
        }
}
