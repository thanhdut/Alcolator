//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by Thanhduy Tran on 6/13/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController
- (float)numberofGlassesForEquivalentAlcoholAmount {
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWhiskeyGlass = 1;  // a 1oz shot
    float alcoholPercentageOfWhiskey = 0.4;  // 40% is average
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    return ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;

}
- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
    int numBeers = self.beerCountSlider.value;
    float numWhiskeyGlasses = self.numberofGlassesForEquivalentAlcoholAmount;
    
    NSString *beerText;
    
    if (numBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    
    if (numWhiskeyGlasses == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    // update the navigation bar
    self.title = [NSString stringWithFormat:NSLocalizedString(@"Whiskey(%.0f %@)", nil),numWhiskeyGlasses, whiskeyText];
}
- (void)buttonPressed:(UIButton *)sender;
{
    [self.beerPercentTextField resignFirstResponder];
    int numBeers = self.beerCountSlider.value;
    float numWhiskeyGlasses = self.numberofGlassesForEquivalentAlcoholAmount;
    NSString *beerText;
    
    if (numBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    
    if (numWhiskeyGlasses == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.", nil), numBeers, beerText, [self.beerPercentTextField.text floatValue], numWhiskeyGlasses, whiskeyText];
    self.resultLabel.text = resultText;
}

@end
