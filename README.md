# breaking-bad
Breaking Bad Character explorer app

## Instructions

This project uses coocapods to manage dependencies. The pods have been excluded from the GitHub repo to conserve space on the repo.

To install the pods navigate to the BreakingBadCharacter directory in the project and run the following command in the terminal:

`pod install`

## Explanation

The project has been coded using a simple MVVM architecture, so as to allow separation of concerns in the code and to simplify the writing of tests. 

I have used the Kingfisher pod to download and cache the images, as it is a very easy way to get the images from the internet. 

I used URLSession to access the API and avoided using Alamofire as I thought it was unnecessary give the simplicity of the API call. 



