class Calculadora:

    def somar(self,a,b):
        x = a + b 
        print(f'O valor da soma é', {x})
        return x

    def subtrair(self,a,b):
        x = a - b 
        print(f'O valor da subtrair é', {x})
        return x

    def multiplicar(self,a,b):
        x = a * b 
        print(f'O valor da multiplicar é', {x})
        return x

    def divisao(self, a, b):
        if b == 0:
            print('Não é possível dividir por zero!')
            return None
        x = a / b
        print(f'O valor da divisão é {x}')
        return x

def menu():
    print('\n==CALCULADORA===')
    print('1 - Somar')
    print('2 - Subtrair')
    print('3 - Multiplicar')
    print('4 - Dividir')
    print('0 - Sair')

    return int(input('Escolha uma opção: '))

