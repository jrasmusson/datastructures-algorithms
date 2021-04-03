import UIKit

/*
 ___                          ___ _      _
/ __|__ _ ___ ___ __ _ _ _   / __(_)_ __| |_  ___ _ _
|(__/ _` / -_|_-</ _` | '_| | (__| | '_ \ ' \/ -_) '_|
\___\__,_\___/__/\__,_|_|    \___|_| .__/_||_\___|_|
                                   |_|

 // Challenge: Implement a Caesar Cipher.
         //
         // A Caesar Cipher is a basic encryption algorithm that takes all the letters message
         // and encrypts them by shifting them over some fixed amount.
         //
         // For example a Caesar Cipher of x3 would map the alphabet like this:
         //
         // Plain:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
         // Cipher:   XYZABCDEFGHIJKLMNOPQRSTUVW
         //
         // And the following text like this:
         //
         // Plaintext:  THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
         // Ciphertext: QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD
         //
         // Write an encrypt and decrypt method of a Caesar Cipher using an offset of 3
         //
 */

class CaesarCipherSimple {
    
    private lazy var encryptMap: [Character: String] = {
        var map = [Character: String]()
        map["A"] = "X"
        map["B"] = "Y"
        map["C"] = "Z"
        map["D"] = "A"
        map["E"] = "B"
        map["F"] = "C"
        map["G"] = "D"
        map["H"] = "E"
        map["I"] = "F"
        map["J"] = "G"
        map["K"] = "H"
        map["L"] = "I"
        map["M"] = "J"
        map["N"] = "K"
        map["O"] = "L"
        map["P"] = "M"
        map["Q"] = "N"
        map["R"] = "O"
        map["S"] = "P"
        map["T"] = "Q"
        map["U"] = "R"
        map["V"] = "S"
        map["W"] = "T"
        map["X"] = "U"
        map["Y"] = "V"
        map["Z"] = "W"
        return map
    }()

    private lazy var decryptMap: [Character: String] = {
        var map = [Character: String]()
        map["X"] = "A"
        map["Y"] = "B"
        map["Z"] = "C"
        map["A"] = "D"
        map["B"] = "E"
        map["C"] = "F"
        map["D"] = "G"
        map["E"] = "H"
        map["F"] = "I"
        map["G"] = "J"
        map["H"] = "K"
        map["I"] = "L"
        map["J"] = "M"
        map["K"] = "N"
        map["L"] = "O"
        map["M"] = "P"
        map["N"] = "Q"
        map["O"] = "R"
        map["P"] = "S"
        map["Q"] = "T"
        map["R"] = "U"
        map["S"] = "V"
        map["T"] = "W"
        map["U"] = "X"
        map["V"] = "Y"
        map["W"] = "Z"
        return map
    }()

    func encrypt(_ plainText: String) -> String {
        var result = ""
        let chars = Array(plainText)
        
        for char in chars {
            var encryptedLetter = " "
            if char != " " {
                encryptedLetter = encryptMap[char]!
            }
            result.append(encryptedLetter)
        }
        return result
    }
    
    func decrypt(_ cipherText: String) -> String {
        var result = ""
        let chars = Array(cipherText)
        
        for char in chars {
            var decryptedLetter = " "
            if char != " " {
                decryptedLetter = decryptMap[char]!
            }
            result.append(decryptedLetter)
        }
        return result
    }

}

let cipher = CaesarCipherSimple()

cipher.encrypt("ABC")                       // XYZ
cipher.encrypt("ATTACK AT FIRST LIGHT")     // XQQXZH XQ CFOPQ IFDEQ
cipher.encrypt("MEET AT THE RUBICON")       // JBBQ XQ QEB ORYFZLK

cipher.decrypt("XYZ")                       // ABC
cipher.decrypt("XQQXZH XQ CFOPQ IFDEQ")     // ATTACK AT FIRST LIGHT
cipher.decrypt("JBBQ XQ QEB ORYFZLK")       // MEET AT THE RUBICON

//
// This is a more algorithmic way of solving the Caesar Cipher using the following equations
//
// E(x) = (x + n) mod 26
// D(x) = (x - n) mod 26
//
// x = letter
// n = offset

// What these equations basically say is, you can take any given letter, shift it by it's offset, and then
// modulus 26 that result (25 letters in the alphabet).
//
// By applying this equation, we can come up with a more generic cipher algorithm, that encrypts and decrypts
// for any generic offset (n).
//
// https://en.wikipedia.org/wiki/Caesar_cipher
// http://www.sanfoundry.com/java-program-implement-caesar-cypher/ (based on)

// Assumption: Upper case only

class CaesarCipherAdvanced {
    
    let ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    func encrypt(_ plainText: String, _ n: Int = 3) -> String {
        var result = ""
        let charsToEncrypt = Array(plainText)
        let lookupMap = Array(ALPHABET)
        
        for charToEncrypt in charsToEncrypt {
            var encryptedChar: Character = " "
            if charToEncrypt != " " {
                let x = lookupMap.firstIndex(of: charToEncrypt)!
                let key = (n + x) % 26
                encryptedChar = lookupMap[key]
            }
            result.append(encryptedChar)
        }
        return result
    }
    
    func decrypt(_ cipherText: String, _ n: Int = 3) -> String {
        var result = ""
        let charsToDecrypt = Array(cipherText)
        let lookupMap = Array(ALPHABET)

        for charToDecrypt in charsToDecrypt {
            var decryptedChar: Character = " "
            if charToDecrypt != " " {
                let x = lookupMap.firstIndex(of: charToDecrypt)!
                let key = (x - n) % 26
                decryptedChar = lookupMap[key]
            }
            result.append(decryptedChar)
        }
        return result
    }
}

let cipherAdvanced = CaesarCipherAdvanced()

// Note: This algorithm shifts left (while the problem asks for right).
//       Keep it left to match solution in Wikipedia and make easier to follow.

cipherAdvanced.encrypt("ABC")                       // DEF
cipherAdvanced.encrypt("ATTACK AT FIRST LIGHT")     // DWWDFN DW ILUVW OLJKW
cipherAdvanced.encrypt("MEET AT THE RUBICON")       // PHHW DW WKH UXELFRQ

cipherAdvanced.decrypt("DEF")                       // ABC
cipherAdvanced.decrypt("DWWDFN DW ILUVW OLJKW")     // ATTACK AT FIRST LIGHT
cipherAdvanced.decrypt("PHHW DW WKH UXELFRQ")       // MEET AT THE RUBICON
