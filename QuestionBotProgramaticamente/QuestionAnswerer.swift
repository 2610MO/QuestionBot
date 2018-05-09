import UIKit
struct MyQuestionAnswerer {
    
    func responseTo(question: String) -> String {
        //let lowerQuestion = question.lowercased()
        let random = arc4random_uniform(20) + 1
        print(random)
        switch random {
        case 1:
            return "En mi opinión, sí"
        case 2:
            return "Es cierto"
        case 3:
            return "Es dicididamente así"
        case 4:
            return "Probablemente"
        case 5:
            return "Buen pronóstico"
        case 6:
            return "Todo apunta a que sí"
        case 7:
            return "Sin duda"
        case 8:
            return "Sí"
        case 9:
            return "Sí - Definitivamente"
        case 10:
            return "Debes confiar en ello"
        case 11:
            return "Respuesta vaga, vuelve a intentarlo"
        case 12:
            return "Pregunta en otro momento"
        case 13:
            return "Será mejor que no te lo diga ahora"
        case 14:
            return "No puedo predecirlo ahora"
        case 15:
            return "Concéntrate y vuelve a preguntar"
        case 16:
            return "No cuentes con ello"
        case 17:
            return "Mi respuesta es no"
        case 18:
            return "Mis fuentes me dicen que no"
        case 19:
            return "Las perspectivas no son buenas"
        case 20:
            return "Muy dudoso"
        default:
            return "Estoy cansado pregunta luego"
        }
       
    }
}
