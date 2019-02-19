class  PasswordHelper{
    var passwordStr:String = ""

    init(check:String) {
        self.passwordStr = check
    }

    @discardableResult
    func hasNumber(result:@escaping (Bool)->() ) -> Self{
        let decimalCharaters = CharacterSet.decimalDigits
        let decimalRange = passwordStr.rangeOfCharacter(from: decimalCharaters)
        let found = (decimalRange != nil)
        result(found)
        return self
    }

    @discardableResult
    func countGreatherThan(_ number:Int, result:@escaping (Bool)->() ) -> Self{
        let match = passwordStr.count >= number
        result(match)
        return self
    }

    @discardableResult
    func includeUpperAndLowerCase(result:@escaping (Bool)->() ) -> Self{
        let lowerCase = CharacterSet.lowercaseLetters
        let upperCase = CharacterSet.uppercaseLetters
        var conditon1 = false
        var conditon2 = false
        for currentCharacter in passwordStr.unicodeScalars{
            if lowerCase.contains(currentCharacter){
                conditon1 = true
            }
            else if upperCase.contains(currentCharacter){
                conditon2 = true
            }
        }
        result(conditon1 && conditon2)
        return self
    }
}
