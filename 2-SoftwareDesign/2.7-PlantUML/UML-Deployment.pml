@startuml

title Deployment for Information System
left to right direction

node "<<Настільний комп'ютер>>" as dk {
  node "<<OС Windows, OС Linux>>" {
    node "<<Веб-навігатор>>" {
      component [.js (Angular)]
    }
  }
}

interface Клавіатура
interface Маніпулятор_миша

Клавіатура -- dk

Маніпулятор_миша -- dk

@enduml
