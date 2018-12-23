Feature: Perform integrated tests on the NodeMCU API

Background:
* url 'http://192.168.0.25'


Scenario: get em lista sem ter nenhuma GPIO criada
Given path 'leds'
When method get
Then status 204


Scenario: get por parâmetro sem nenhuma GPIO criada
Given path 'leds?id=1'
When method get
Then status 404


Scenario: Ligar todos os leds

Given path 'leds'
And request {"gpio": 2}
When method post
Then status 201
And match response == {"id": 1, "gpio": 2, "pinMod": "", "potencia": 0, "status": 0}
* def savedLed1 = response

Given path 'leds'
And request {"id": #(savedLed1.id), #(savedLed1.gpio), "pinMod": "ANALOG", "potencia": 1023, "status": 1}
When method put
Then status 200

Given path 'leds'
And request {"gpio": 4}
When method post
Then status 201
And match response == {"id": 2, "gpio": 4, "pinMod": "", "potencia": 0, "status": 0}
* def savedLed2 = response

Given path 'leds'
And request {"id": #(savedLed2.id), #(savedLed2.gpio), "pinMod": "ANALOG", "potencia": 1023, "status": 1}
When method put
Then status 200

Given path 'leds'
And request {"gpio": 5}
When method post
Then status 201
And match response == {"id": 3, "gpio": 5, "pinMod": "", "potencia": 0, "status": 0}
* def savedLed3 = response

Given path 'leds'
And request {"id": #(savedLed3.id), #(savedLed3.gpio), "pinMod": "ANALOG", "potencia": 1023, "status": 1}
When method put
Then status 200

Given path 'leds'
And request {"gpio": 12}
When method post
Then status 201
And match response == {"id": 4, "gpio": 12, "pinMod": "", "potencia": 0, "status": 0}
* def savedLed4 = response

Given path 'leds'
And request {"id": #(savedLed4.id), #(savedLed4.gpio), "pinMod": "ANALOG", "potencia": 1023, "status": 1}
When method put
Then status 200

Given path 'leds'
And request {"gpio": 13}
When method post
Then status 201
And match response == {"id": 5, "gpio": 13, "pinMod": "", "potencia": 0, "status": 0}
* def savedLed5 = response

Given path 'leds'
And request {"id": #(savedLed5.id), #(savedLed5.gpio), "pinMod": "ANALOG", "potencia": 1023, "status": 1}
When method put
Then status 200

Given path 'leds'
And request {"gpio": 14}
When method post
Then status 201
And match response == {"id": 6, "gpio": 14, "pinMod": "", "potencia": 0, "status": 0}
* def savedLed6 = response

Given path 'leds'
And request {"id": #(savedLed6.id), #(savedLed6.gpio), "pinMod": "ANALOG", "potencia": 1023, "status": 1}
When method put
Then status 200

Given path 'leds'
And request {"gpio": 15}
When method post
Then status 201
And match response == {"id": 7, "gpio": 15, "pinMod": "", "potencia": 0, "status": 0}
* def savedLed7 = response

Given path 'leds'
And request {"id": #(savedLed7.id), #(savedLed7.gpio), "pinMod": "ANALOG", "potencia": 1023, "status": 1}
When method put
Then status 200

Given path 'leds'
And request {"gpio": 16}
When method post
Then status 201
And match response == {"id": 8, "gpio": 16, "pinMod": "", "potencia": 0, "status": 0}
* def savedLed8 = response

Given path 'leds'
And request {"id": #(savedLed8.id), #(savedLed8.gpio), "pinMod": "ANALOG", "potencia": 1023, "status": 1}
When method put
Then status 200


Scenario: Desligar todos os leds
Given path 'leds'
And request {"id": 1, "status": 0}
When method put
Then status 200

Given path 'leds'
And request {"id": 2, "status": 0}
When method put
Then status 200

Given path 'leds'
And request {"id": 3, "status": 0}
When method put
Then status 200

Given path 'leds'
And request {"id": 4, "status": 0}
When method put
Then status 200

Given path 'leds'
And request {"id": 5, "status": 0}
When method put
Then status 200

Given path 'leds'
And request {"id": 6, "status": 0}
When method put
Then status 200

Given path 'leds'
And request {"id": 7, "status": 0}
When method put
Then status 200

Given path 'leds'
And request {"id": 8, "status": 0}
When method put
Then status 200


Scenario: Envia JSON com gpio inválida para post
Given path 'leds'
And request {"gpio": 50}
When method post
Then status 404

Scenario: Envia JSON com gpio já utilizada para post
Given path 'leds'
And request {"gpio": 2}
When method post
Then status 404

Scenario: Não indica gpio para post
Given path 'leds'
And request {"id": 2}
When method post
Then status 404

Scenario: Não indica id para put
Given path 'leds'
And request {"status": 0}
When method put
Then status 404


Scenario: get em lista após todas GPIOs criadas
Given path 'leds'
When method get
Then status 200
And match response == [{"id":1,"gpio":2,"pinMod":"","potencia":0,"status":0},{"id":2,"gpio":4,"pinMod":"","potencia":0,"status":0},{"id":3,"gpio":5,"pinMod":"","potencia":0,"status":0},{"id":4,"gpio":12,"pinMod":"","potencia":0,"status":0},{"id":5,"gpio":13,"pinMod":"","potencia":0,"status":0},{"id":6,"gpio":14,"pinMod":"","potencia":0,"status":0},{"id":7,"gpio":15,"pinMod":"","potencia":0,"status":0},{"id":8,"gpio":16,"pinMod":"","potencia":0,"status":0}]


Scenario: get por parâmetro com gpio criada
Given path 'leds'
And params {"id": 1}
When method get
Then status 200




