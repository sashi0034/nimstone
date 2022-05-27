
type Token = object of RootObj
    lineNumber: int
    isNumber: bool
    isString: bool
    isIdentifier: bool

type NumToken = object of Token
    number: int

type IdToken = object of Token
    identifier: ref string

type StrToken = object of Token
    str: ref string

type StoneException* = object of CatchableError
    stone: string

func createNumToken*(line: int, number: int): ref NumToken = 
    result=new(NumToken)
    result[]=NumToken(number: number, lineNumber: line, isNumber: true, isString: false, isIdentifier: false)
func createIdToken*(line: int, identifier: ref string): ref IdToken = 
    result=new(IdToken)
    result[]=IdToken(identifier: identifier, lineNumber: line, isNumber: false, isString: false, isIdentifier: true)
func createStrToken*(line: int, str: ref string): ref StrToken = 
    result=new(StrToken)
    result[]=StrToken(str: str, lineNumber: line, isNumber: false, isString: true, isIdentifier: false)

func isNumber*(self: ref Token): bool = 
    return self.isNumber

func isIdentifier*(self: ref Token): bool = 
    return self.isIdentifier

func isString*(self: ref Token): bool = 
    return self.isString

func getLineNumber*(self: ref Token): int =
    return self.lineNumber

# func getNumber*(self: ref Token): int =
#     var e: ref StoneException
#     new(e)
#     e.stone = "stone error"
#     e.msg = "not number token"
#     raise e

func getNumber*(self: ref NumToken): int =
    return self.number

func getText*(self: ref IdToken): ref string = 
    return self.identifier

func getLiteral*(self: ref StrToken): ref string = 
    return self.str


