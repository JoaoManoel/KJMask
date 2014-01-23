/*/
//  KJMask.h
//  
//
//  Created by João Manoel Lins on 17/01/14.
//  Copyright (c) 2014 João Manoel Lins. All rights reserved.
//

The MIT License (MIT)

Copyright (c) 2014 João Manoel Lins, joaomanoellins@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

#import <Foundation/Foundation.h>

/*
 
  222222222222222     333333333333333
 2:::::::::::::::22  3:::::::::::::::33
 2::::::222222:::::2 3::::::33333::::::3
 2222222     2:::::2 3333333     3:::::3
             2:::::2             3:::::3
             2:::::2             3:::::3
          2222::::2      33333333:::::3
     22222::::::22       3:::::::::::3
   22::::::::222         33333333:::::3
 2:::::22222                    3:::::3
 2:::::2                         3:::::3
 2:::::2                         3:::::3
 2:::::2       2222223333333     3:::::3
 2::::::2222222:::::23::::::33333::::::3
 2::::::::::::::::::23:::::::::::::::33
 22222222222222222222 333333333333333
 
 
    **** COMO USAR ****
 
 1) Declare uma variavel KJMask na sua interface:
 
    @interface ViewController : UIViewController<UITextFieldDelegate>{
        KJMask *mask;
    }
 
 2) no viewDidLoad do .m da sua classe de um alloc e init no mask:
 
    mask = [KJMask alloc]init];
 
 3) No metodo abaixo do delegate da textField
    -(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 
    Faça o seguinte:
 
    1) Primeiro coloque essas 2 linhas:
        
        mask.texto = textField.text;
        mask.range = range;
    2) Faça varios ifs, cada if sera pra algum determinado tipo de mascara... telefone 8 digitos, CEP, CPF, oq você quiser...
 
        if (textField == _cpfTextField) {
            mask.tipoMascara = kTipoCPF;
            NSString *retorno = [mask utilizarMascara];
            if ([retorno isEqualToString:@"cheio"]) {
                return NO;
        }else{
            [textField setText:retorno];
            return YES;
            }
        }
 
        Para os outros ifs só precisa mudar o if (textField == _cpfTextField) e mask.tipoMascara = kTipoCPF,  o resto fica igual... 
 
    Lembrando que esse _cpfTextField é o nome da property que eu dei para esse textField
 
    Exemplo do código para mascara de CPF e CEP ficaria assim:
 
-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    mask.texto = textField.text;
    mask.range = range;
    
    if (textField == _cpfTextField) {
        mask.tipoMascara = kTipoCPF;
        
        NSString *retorno = [mask utilizarMascara];
        
        if ([retorno isEqualToString:@"cheio"]) {
            return NO;
        }else{
            [textField setText:retorno];
            return YES;
        }
    }
    
    if (textField == _cepTextField) {
        mask.tipoMascara = kTipoCEP;
        
        NSString *retorno = [mask utilizarMascara];
        
        if ([retorno isEqualToString:@"cheio"]) {
            return NO;
        }else{
            [textField setText:retorno];
            return YES;
        }
    }
    
    return YES;
}

 Espero que essa biblioteca tenha ajudado :D
 
*/

typedef enum {
    kTipoCEP,
    kTipoCPF,
    kTipoDATA,
    kTipoTEL8, // telefone 8 digitos
    kTipoTEL9  // telefone 9 digitos
}tipoMascaras;

@interface KJMask : NSObject

@property (strong, nonatomic) NSString *texto;
@property (nonatomic) NSRange range;
@property (nonatomic, assign) tipoMascaras tipoMascara;

-(NSString *)utilizarMascara;

@end
