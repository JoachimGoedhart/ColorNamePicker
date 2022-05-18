//  ColorNamePicker - naming a color
//  To use it, run the macro, open an image and move the cursor over it. 
//  When pressing the mouse button, the color of the pixel under the cursor will be named.
// Names are assigned basedd on closest (euclidean) distance to and exsiting set of names
// Existing names are from the X11 color list
//
// Inspited by the color_splash_effect_tool.ijm by Jerome Mutterer
// https://gist.github.com/mutterer/89751202d2a074a51b8adb90783aaeab

//Read file from URL with colornames&RGB codes and convert into lines
/url="https://raw.githubusercontent.com/JoachimGoedhart/ColorNamePicker/main/X11_Color_names.csv"
//lines=split(File.openUrlAsString(url),'\n');

var radius=12;
var font_color="yellow";

macro "ColorNamePicker Tool - N33CfffD00CfffD01CfffD02CfffD03CfffD04CfffD05CfffD06CfffD07CeeeD08CdeeD09CceeD0aCceeD0bCdeeD0cCeeeD0dCfffD0eCfffD0fCfffD0gCfffD0hCfffD0iCfffD0jCfffD0kCfffD0lCfffD10CfffD11CfffD12CfffD13CfffD14CfffD15CcedD16C7ebD17C4ecD18C2fdD19C1feD1aC1efD1bC2dfD1cC3ceD1dC7beD1eCcdeD1fCfffD1gCfffD1hCfffD1iCfffD1jCfffD1kCfffD1lCfffD20CfffD21CfffD22CfffD23CeeeD24C7eaD25C1f9D26C1faD27C1fcD28C2fdD29C2ffD2aC2ffD2bC2dfD2cC1cfD2dC1afD2eC29fD2fC7aeD2gCeeeD2hCfffD2iCfffD2jCfffD2kCfffD2lCfffD30CfffD31CfffD32CdeeD33C5e8D34C2f7D35C5faD36C6fbD37C5fcD38C4fdD39C4ffD3aC4ffD3bC4dfD3cC3cfD3dC3afD3eC28fD3fC06fD3gC58eD3hCddeD3iCfffD3jCfffD3kCfffD3lCfffD40CfffD41CeeeD42C5e7D43C5f8D44CafcD45C9fcD46C8fcD47C7fdD48C6fdD49C5ffD4aC5ffD4bC5dfD4cC5cfD4dC4afD4eC38fD4fC27fD4gC14fD4hC56eD4iCeeeD4jCfffD4kCfffD4lCfffD50CfffD51C7e8D52C6f7D53CcfcD54CafcD55CafcD56C9fcD57C8fdD58C8fdD59C7ffD5aC7ffD5bC7dfD5cC6cfD5dC5afD5eC48fD5fC36fD5gC24fD5hC02fD5iC78eD5jCfffD5kCfffD5lCfffD60CcecD61C5f5D62CcfcD63CcfcD64CbfbD65CafbD66CafcD67CafdD68C9feD69C9ffD6aC8ffD6bC8dfD6cC7cfD6dC7afD6eC68fD6fC46fD6gC34fD6hC22fD6iC22fD6jCcceD6kCfffD6lCfffD70C8e8D71Caf9D72CefeD73CcfcD74CbfbD75CbfbD76CbfcD77C7b9D78C698D79C9edD7aCaffD7bCadfD7cC9cfD7dC8afD7eC78fD7fC56fD7gC44fD7hC32cD7iC20eD7jC87eD7kCfffD7lCeeeD80C7e5D81CefdD82CcecD83C8a8D84C9c9D85CbfbD86CcfcD87C565D88C111D89C8aaD8aCbefD8bCbdfD8cCabfD8dC99fD8eC88fD8fC76fD8gC54dD8hC002D8iC209D8jC64eD8kCeeeD8lCdedD90C9f6D91CcdcD92C111D93D94C010D95C786D96CcfcD97C565D98D99C122D9aC344D9bC334D9cC334D9dC224D9eC224D9fC224D9gC102D9hD9iC318D9jC62fD9kCddeD9lCdecDa0Cbf7Da1C888Da2Da3Da4Da5C333Da6CcebDa7C554Da8Da9DaaDabDacDadDaeDafDagDahDaiC418DajC71fDakCdceDalCdecDb0Ccf7Db1C999Db2Db3Db4Db5C453Db6CdebDb7C443Db8Db9DbaDbbDbcDbdDbeDbfDbgDbhDbiC518DbjC91fDbkCdceDblCeedDc0Ccf5Dc1CffeDc2C665Dc3C111Dc4C443Dc5Cbb8Dc6CffcDc7C665Dc8C111Dc9C211DcaC211DcbC211DccC212DcdC212DceC212DcfC102DcgDchDciC618DcjCa2fDckCedeDclCeeeDd0Cce5Dd1CffdDd2CffdDd3CeebDd4CefbDd5CffbDd6CffbDd7CfebDd8CecbDd9CebaDdaCeabDdbCeacDdcCe9dDddCe8dDdeCe7eDdfCe6eDdgC93aDdhDdiC709DdjCb4eDdkCeeeDdlCfffDe0Cde8De1Cff9De2CffdDe3CffcDe4CffbDe5CffbDe6CfeaDe7CfdaDe8CfcaDe9CfbaDeaCfabDebCfacDecCf9dDedCf8eDeeCf7eDefCf5fDegCf4fDehC91aDeiCb0dDejCd7dDekCfffDelCfffDf0CeedDf1Cef5Df2CffcDf3CffcDf4CffbDf5CfeaDf6CfdaDf7Cfc9Df8Cfb9Df9Cf98DfaCf89DfbCf8aDfcCf7bDfdCf7cDfeCf6dDffCf4eDfgCf3fDfhCf2fDfiCe2fDfjCdceDfkCfffDflCfffDg0CfffDg1Cdd8Dg2Cfe6Dg3CffcDg4CfeaDg5CfdaDg6Cfc9Dg7Cfb8Dg8Cfa8Dg9Cf87DgaCf77DgbCf79DgcCf6aDgdCf5bDgeCf4cDgfCf3cDggCf2dDghCf0eDgiCe8dDgjCfffDgkCfffDglCfffDh0CfffDh1CeeeDh2Cec5Dh3Cfd5Dh4CfeaDh5Cfd9Dh6Cfc8Dh7Cfa7Dh8Cf86Dh9Cf65DhaCf56DhbCf57DhcCf58DhdCf49DheCf3aDhfCf2bDhgCf1cDhhCe5cDhiCeeeDhjCfffDhkCfffDhlCfffDi0CfffDi1CfffDi2CeeeDi3Ceb5Di4Cfa2Di5Cfa5Di6Cfa6Di7Cf85Di8Cf64Di9Cf44DiaCf44DibCf46DicCf37DidCf38DieCf29DifCf0aDigCe5bDihCeeeDiiCfffDijCfffDikCfffDilCfffDj0CfffDj1CfffDj2CfffDj3CeeeDj4Cdb8Dj5Cf82Dj6Cf61Dj7Cf51Dj8Cf42Dj9Cf32DjaCf23DjbCf24DjcCf15DjdCf16DjeCf28DjfCd8bDjgCeeeDjhCfffDjiCfffDjjCfffDjkCfffDjlCfffDk0CfffDk1CfffDk2CfffDk3CfffDk4CfffDk5CeddDk6Cea8Dk7Ce74Dk8Cf42Dk9Cf21DkaCf12DkbCf24DkcCe47DkdCe8aDkeCeddDkfCfffDkgCfffDkhCfffDkiCfffDkjCfffDkkCfffDklCfffDl0CfffDl1CfffDl2CfffDl3CfffDl4CfffDl5CfffDl6CfffDl7CeffDl8CeddDl9CedcDlaCeccDlbCeddDlcCeffDldCfffDleCfffDlfCfffDlgCfffDlhCfffDliCfffDljCfffDlkCfffDll"{

//Read local file with colornames&RGB codes and convert into lines
path="/Users/Joachim/surfdrive2/ImageJ-macro/"+"X11_Color_names.csv"
lines=split(File.openAsString(path),'\n');

//Initialization
logOpened = false;
setBatchMode(1);
name = "unknown";
//button=1;//shift
button=16;//click
getCursorLoc(x, y, z, flags);

//Set color&font for overlay
setColor(font_color);
setFont("SanSerif", 16, "antialiased");

    while (!logOpened || isOpen("Log")) {

        getCursorLoc(x, y, z, flags);

	if (flags&button!=0) {
		dist = 100000000;
             		 v=getPixel(x,y);
  		r=(v&0xff0000)>>16;
  		g=(v&0x00ff00)>>8;
  		b=(v&0x0000ff);

		for(i=1; i<lines.length; i++) {
			items = split(lines[i],",");
			name = items[0];
			r_dif=-items[1]+r;
			g_dif = -items[2]+g;
			b_dif = -items[3]+b;
			
			//calcultae euclidean distance from existing color in the RGB cube
			newdist = (r_dif)*(r_dif) + (g_dif)*(g_dif) + (b_dif)*(b_dif);
			//if value is lower than previous, keep that name
			if (newdist<dist) {dist=newdist;colorname=name;}
		}


  		makeOval(x-radius,y-radius,2*radius,2*radius);
  		fillColor = IJ.pad(toHex(b+g<<8+r<<16),6);
		Overlay.remove;
  		Overlay.addSelection("", 0, fillColor);
  		makeOval(x-radius,y-radius,2*radius,2*radius);
  		Overlay.addSelection("grey", 2);
		Overlay.drawString(colorname, x+radius, y-radius);
		Overlay.show();


	}//close if
   	if (flags&button==0) {wait(1000);Overlay.remove;} 

   }//close while

}

macro "ColorNamePicker Tool Options" {
	Dialog.create("Settings");
	Dialog.addNumber("Picker lens radius", radius);
	Dialog.addString("Font color", font_color);
	Dialog.show();
	radius=Dialog.getNumber();
	font_color=Dialog.getString();
}
