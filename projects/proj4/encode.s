// Rafael Dejesus
// Shana Slavin
// CPSC 2310
// Project 4
// Due December 7, 2018
 
 
/* function name:  encode
 
   description:  This program encodes and decodes messages
 
   input parameter(s):
    r0 - address of input string
    r1 - address of output string
    r2 - address of key string
    r3 - encode/decode switch
         r3 == 0 means encode
         r3 == 1 means decode
 
   return value (if any):
    none
     
   other output parameters:
    none
 
   effect/output
    output string is updated with encoded or decoded message
 
   method / effect:
     
 
   typical calling sequence:
        pass input parameters
    use modified output register
 
 
   local register usage:
    input         r0
    output        r1
    key           r2
    decodeFlag    r3
    inputIndex    r4
    stringIVal    r5
    keyIVal       r6
    keyIndex      r7
    temp          r8
 
 */
 
    .global encode
 
  input         .req r0
  output        .req r1
  key           .req r2
  decodeFlag    .req r3
  inputIndex    .req r4
  stringIVal    .req r5
  keyIVal       .req r6
  keyIndex      .req r7
  temp          .req r8
 
encode:
  push {r4-r8, lr}
 
  mov keyIndex, #0
  mov inputIndex, #0
 
encodeLoop:
  // loads values
  ldrb stringIVal, [input, inputIndex]
  bl loadKeyIVal              
 
 
  //If end of input, stop
  cmp stringIVal, #0  
  beq exit
 
  mov temp, stringIVal
 
  /* start alg */
 
  cmp keyIVal, #96
  bls continue
  cmp stringIVal, #96
  bls continue
 
  // check for decode
  cmp decodeFlag, #1
  bge doDecode
 
  // encode:
  sub keyIVal, keyIVal, #96
  sub stringIVal, stringIVal, #96
 
  add temp, keyIVal, stringIVal
  cmp temp, #26
  bls backToAscii
 
  sub temp, temp, #26
 
backToAscii:
  add temp, temp, #96
 
  /* end alg */
 
continue:
  // store value in output
  strb temp, [output, inputIndex]  
 
  // increment counters
  add inputIndex, inputIndex, #1  
  add keyIndex, keyIndex, #1
 
  bal encodeLoop
 
  // exit program
exit:
  mov temp, #0
  strb temp, [output, inputIndex]
  pop {r4-r8, pc}
 
 
  //function for loading keyIVal
loadKeyIVal:
  ldrb keyIVal, [key, keyIndex]
  cmp keyIVal, #0
  bne loadKeyIValGood
 
  mov keyIndex, #0
  ldrb keyIVal, [key]
 
  loadKeyIValGood:
    bx lr
 
  // decodes message
doDecode:
  sub keyIVal, keyIVal, #96
  sub temp, stringIVal, keyIVal
  cmp temp, #97
  bge continue
 
  add temp, temp, #26
 
  bal continue
