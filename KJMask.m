/*/
//  KJMask.m
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

#import "KJMask.h"

@implementation KJMask

@synthesize texto,range,tipoMascara;

-(NSString *)utilizarMascara{
 
    // CEP
    if(self.tipoMascara == kTipoCEP){
        if (texto.length > 9 && range.length == 0)
            // o range.length == 0 é para quando eu digitar um caractere, então eu coloco esse range.length == 0 para não entrar nesse if quando eu estiver deletando pois se fosse só texto.length > 9 quando chegasse a maior que 9 eu não ia conseguir apagar nem adicionar nenhum caractere....
        {
            return @"cheio"; // retorna "cheio" para não adicionar mais caracteres....
        }
        
        if (range.length == 0) {
            // range.length == 0 é sempre que ele digitar um novo caractere...
            switch (texto.length) {
                case 2:
                    return [texto stringByAppendingString:@"."];
                    break;
                    
                case 6:
                    return [texto stringByAppendingString:@"-"];
                    break;
                    
                default:
                    return texto;
                    break;
            }
        }else if ([texto length] > 0){
            
            // se ele não digitou nenhum caractere e sim deletou retornamos a string com um caractere a menos
                return [texto substringToIndex:[texto length]];
            }
    }

    // TELEFONE 8 Digitos
    if(self.tipoMascara == kTipoTEL8){
        if (texto.length > 13 && range.length == 0)
        {
            return @"cheio";
        }
        
        if (range.length == 0) {
            switch (texto.length) {
                case 0:
                    return [texto stringByAppendingString:@"("];
                    break;
                    
                case 3:
                    return [texto stringByAppendingString:@") "];
                    break;
                
                case 9:
                    return [texto stringByAppendingString:@"-"];
                    break;
                    
                default:
                    return texto;
                    break;
            }
        }else if ([texto length] > 0){
            return [texto substringToIndex:[texto length]];
        }
    }
    
    
    // TELEFONE 9 Digitos
    if(self.tipoMascara == kTipoTEL9){
        if (texto.length > 14 && range.length == 0)
        {
            return @"cheio";
        }
        
        if (range.length == 0) {
            switch (texto.length) {
                case 0:
                    return [texto stringByAppendingString:@"("];
                    break;
                    
                case 3:
                    return [texto stringByAppendingString:@") "];
                    break;
                    
                case 10:
                    return [texto stringByAppendingString:@"-"];
                    break;
                    
                default:
                    return texto;
                    break;
            }
        }else if ([texto length] > 0){
            return [texto substringToIndex:[texto length]];
        }
    }
    
    // CPF
    if(self.tipoMascara == kTipoCPF){
        if (texto.length > 13 && range.length == 0)
        {
            return @"cheio";
        }
        
        if (range.length == 0) {
            switch (texto.length) {
                case 3:
                    return [texto stringByAppendingString:@"."];
                    break;
                    
                case 7:
                    return [texto stringByAppendingString:@"."];
                    break;
                    
                case 11:
                    return [texto stringByAppendingString:@"-"];
                    break;
                    
                default:
                    return texto;
                    break;
            }
        }else if ([texto length] > 0){
            return [texto substringToIndex:[texto length]];
        }
    }
    
    // DATA
    if(self.tipoMascara == kTipoDATA){
        if (texto.length > 9 && range.length == 0)
        {
            return @"cheio";
        }
        
        if (range.length == 0) {
            switch (texto.length) {
                case 2:
                    return [texto stringByAppendingString:@"/"];
                    break;
                    
                case 5:
                    return [texto stringByAppendingString:@"/"];
                    break;
                    
                default:
                    return texto;
                    break;
            }
        }else if ([texto length] > 0){
            return [texto substringToIndex:[texto length]];
        }
    }

    return @"";
}

@end
