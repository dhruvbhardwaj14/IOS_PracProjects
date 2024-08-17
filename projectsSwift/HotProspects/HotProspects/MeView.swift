//
//  MeView.swift
//  HotProspects
//
//  Created by Dhruv Bhardwaj on 16/09/22.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @State private var name="Anonymous"
    @State private var emailAddress="you@yoursite.com"
    @State private var qrCode=UIImage()
    
    let context=CIContext()
    let filter=CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                            .textContentType(.name)
                            .font(.body)

                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.body)
                Image(uiImage:qrCode )
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu{
                        Button {
                            let imageSaver=ImageSaver()
                            imageSaver.writeToPhotoAlbum(image: qrCode)
                        } label: {
                            Label("Save to Photos", systemImage: "square.and.arrow.down")
                        }
                    }
                    
            }
            .navigationTitle("Your Code")
            .onAppear(perform: updateCode)
            .onChange(of: name) { _ in updateCode() }
            .onChange(of: emailAddress) { _ in updateCode() }
        }
    }
    func updateCode(){
        qrCode=generateQrCode(from: "\(name)\n\(emailAddress)")
    }
    func generateQrCode(from string:String)->UIImage{
        filter.message=Data(string.utf8)
        if let outputImage=filter.outputImage{
            if let cgImage=context.createCGImage(outputImage,from:outputImage.extent){
                return UIImage(cgImage: cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
