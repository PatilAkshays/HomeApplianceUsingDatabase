//
//  ViewController.m
//  HomeAppliance
//
//  Created by Mac on 17/08/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    deviceDictionary = [[NSMutableDictionary alloc]init];
    
    [self.textFieldPrice setKeyboardType:UIKeyboardTypeNumberPad];
    
    rootDatabaseRef = [[FIRDatabase database] reference];
    
    [self alertWithTitle:@"Hello" message:@"Please Select The Device First."];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag == 100 ) {
        [deviceDictionary setValue:textField.text forKey:@"name"];
    }
    else if (textField.tag == 101 ) {
        [deviceDictionary setValue:textField.text forKey:@"company"];
    }
    else if (textField.tag == 102 ) {
        [deviceDictionary setValue:textField.text forKey:@"price"];
    }
    
    [textField resignFirstResponder];
    
    NSLog(@"%@",deviceDictionary);
    return YES;
}



- (IBAction)buttonSagement:(id)sender {
    
    mySegement = sender;
    
    if (mySegement.selectedSegmentIndex == 0) {
        
        [deviceDictionary setValue:@"TV" forKey:@"type"];
    }
    else if (mySegement.selectedSegmentIndex == 1) {
        
        [deviceDictionary setValue:@"Smartphone" forKey:@"type"];
    }
    else if (mySegement.selectedSegmentIndex == 2) {
        
        [deviceDictionary setValue:@"AC" forKey:@"type"];
    }
    
    NSLog(@"%@",deviceDictionary);

}

- (IBAction)buttonSave:(id)sender {
    
    [self.textFieldName resignFirstResponder];
    [self.textFieldCompany resignFirstResponder];
    [self.textFieldPrice resignFirstResponder];

    [deviceDictionary setObject:self.textFieldName.text forKey:@"name"];
    [deviceDictionary setObject:self.textFieldCompany.text forKey:@"company"];
    [deviceDictionary setObject:self.textFieldPrice.text forKey:@"price"];
    
    NSString *firstField = self.textFieldName.text;
    
    NSString *secondField = self.textFieldCompany.text;
    
    NSString *thirdField = self.textFieldPrice.text;
    

    if (firstField.length > 0) {
        
        if (secondField.length >0) {
            
            if (thirdField.length>0) {
                if (mySegement.selectedSegmentIndex == 0) {
                    
                    
                    [[[rootDatabaseRef child:@"TV"] childByAutoId] setValue:deviceDictionary withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
                        if (error) {
                            
                            [self alertWithTitle:@"Error!" message:@"Please Try Again"];
                            
                            NSLog(@"%@",error.localizedDescription);
                            
                        }
                        else {
                            [self alertWithTitle:@"Data Saved!" message:@"Successfully"];
                            NSLog(@"Success");
                        }
                        
                    }];
                }
                else if (mySegement.selectedSegmentIndex == 1) {
                    
                    [[[rootDatabaseRef child:@"SmartPhone"] childByAutoId] setValue:deviceDictionary withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
                        if (error) {
                            
                            [self alertWithTitle:@"Error!" message:@"Please Try Again"];
                            NSLog(@"%@",error.localizedDescription);
                            
                        }
                        else {
                            [self alertWithTitle:@"Data Saved!" message:@"Successfully"];
                            NSLog(@"Success");
                        }
                        
                    }];
                }
                else if (mySegement.selectedSegmentIndex == 2) {
                    
                    [[[rootDatabaseRef child:@"AC"] childByAutoId] setValue:deviceDictionary withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
                        if (error) {
                            [self alertWithTitle:@"Error!" message:@"Please Try Again"];
                            NSLog(@"%@",error.localizedDescription);
                            
                        }
                        else {
                            
                            [self alertWithTitle:@"Data Saved!" message:@"Successfully"];
                            NSLog(@"Success");
                        }
                        
                    }];
                }
                
                self.textFieldName.text = [NSString stringWithFormat:@""];
                self.textFieldCompany.text = [NSString stringWithFormat:@""];
                self.textFieldPrice.text = [NSString stringWithFormat:@""];

            }
            else{
                
                [self alertWithTitle:@"Alert" message:@"Please Enter Info.."];
            }
            
       }
        else{
            [self alertWithTitle:@"Alert" message:@"Please Enter Info.."];

        }
    
   }
    else{
        [self alertWithTitle:@"Alert" message:@"Please Enter Info.."];

    }
    
    self.textFieldName.text = [NSString stringWithFormat:@""];
    self.textFieldCompany.text = [NSString stringWithFormat:@""];
    self.textFieldPrice.text = [NSString stringWithFormat:@""];

}

-(void)alertWithTitle: (NSString *)title message:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *OK =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        //[self viewDidLoad];
    }];
    
    [alert addAction:OK];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
