//
//  quizBrain.swift
//  Quizzler
//
//  Created by Can 🚀 on 28.05.2025.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Fenerbahçe, Süper Lig'in 1959'da oynanan ilk sezonunun şampiyonudur.", a: "True"),
        Question(q: "Ali Koç, Fenerbahçe başkanlığına ilk kez 2015 yılında seçilmiştir.", a: "False"),
        Question(q: "Aziz Yıldırım, Fenerbahçe başkanlığını yaklaşık yirmi yıl sürdürmüştür.", a: "True"),
        Question(q: "Rüştü Reçber, Fenerbahçe'ye Barcelona'dan transfer edilerek gelmiştir.", a: "False"),
        Question(q: "Fenerbahçe, 2007-08 sezonunda Şampiyonlar Ligi'nde çeyrek finale yükselmiştir.", a: "True"),
        Question(q: "Fenerbahçe'yi 2007-08 Şampiyonlar Ligi çeyrek finalinde Liverpool elemiştir.", a: "False"),
        Question(q: "Fenerbahçe, 2012-13 sezonunda UEFA Avrupa Ligi'nde yarı final oynamıştır.", a: "True"),
        Question(q: "Volkan Demirel, Fenerbahçe'de hem kalecilik hem de teknik ekip görevi yapmıştır.", a: "True"),
        Question(q: "Emre Belözoğlu, Fenerbahçe forması altında yalnızca tek bir dönem oynamıştır.", a: "False"),
        Question(q: "Rüştü Reçber, kariyeri boyunca İspanya'da hiç forma giymemiştir.", a: "False"),
        Question(q: "Roberto Carlos, Fenerbahçe'ye transfer olmadan önce Dünya Kupası kazanmıştı.", a: "True"),
        Question(q: "Can Bartu, Fenerbahçe'de yalnızca futbol branşında mücadele etmiştir.", a: "False"),
        Question(q: "Alex de Souza, Fenerbahçe'ye Arjantin'deki bir kulüpten transfer edilmiştir.", a: "False"),
        Question(q: "Alex de Souza, Fenerbahçe'de kaptanlık görevi üstlenmiştir.", a: "True"),
        Question(q: "Roberto Carlos, Fenerbahçe forması altında yalnızca bir sezon oynamıştır.", a: "False"),
        Question(q: "Fenerbahçe Kadın Basketbol Takımı, EuroLeague şampiyonluğu kazanmıştır.", a: "True"),
        Question(q: "Lefter Küçükandonyadis'in bilinen lakabı 'Ordinaryüs'tür.", a: "True"),
        Question(q: "Fenerbahçe'nin Avrupa kupalarındaki ilk katılımı 1980'li yıllarda gerçekleşmiştir.", a: "False"),
        Question(q: "Fenerbahçe adı, kulübün ilk başkanının soyadından gelmektedir.", a: "False"),
        Question(q: "Şükrü Saracoğlu, Fenerbahçe'nin kurucuları arasında yer almaktadır.", a: "False"),
        Question(q: "Şükrü Saracoğlu, Fenerbahçe başkanlığının yanı sıra Türkiye Cumhuriyeti Başbakanlığı görevinde de bulunmuştur.", a: "True"),
        Question(q: "Fenerbahçe, bir Avrupa kupasında final oynamış bir kulüptür.", a: "False"),
        Question(q: "Fenerbahçe'nin Şampiyonlar Ligi tarihindeki en iyi derecesi yarı finaldir.", a: "False"),
        Question(q: "Fenerbahçe, 2007-08 Şampiyonlar Ligi'nde son 16 turunda Sevilla'yı elemiştir.", a: "True"),
        Question(q: "Fenerbahçe'yi 2012-13 UEFA Avrupa Ligi yarı finalinde eleyen takım Benfica'dır.", a: "True"),
        Question(q: "Türkiye Futbol Federasyonu, 1959 öncesinde kazanılan şampiyonlukları resmi Süper Lig şampiyonluğu olarak saymaktadır.", a: "False"),
        Question(q: "Fenerbahçe, Şampiyonlar Ligi çeyrek finaline birden fazla kez yükselmiştir.", a: "False"),
        Question(q: "Fenerbahçe, Şampiyonlar Ligi çeyrek finaline Aziz Yıldırım'ın başkanlığı döneminde yükselmiştir.", a: "True"),
        Question(q: "Fenerbahçe Erkek Basketbol Takımı, EuroLeague şampiyonluğunu İstanbul'da oynanan Dörtlü Final'de kazanmıştır.", a: "True"),
        Question(q: "Fenerbahçe'nin 2010-11 Süper Lig şampiyonluğu, ligin son haftasında belli olmuştur.", a: "True")
    ]
    
    var questionNumber = 0
    var userScore = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            userScore += 2
            return true
        }
        else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber < (quiz.count - 1) {
            questionNumber += 1
        }
        else {
            questionNumber = 0
            userScore = 0
        }
    }
    
    func getScore() -> Int {
        return userScore
    }
    
}
