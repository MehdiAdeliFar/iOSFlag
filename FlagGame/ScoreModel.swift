

import Foundation
class Score{
    var id:Int
    var time:Int
    var questions:Int
    var correct:Int
    init(_id:Int,_time:Int,_q:Int,_c:Int) {
        self.id=_id
        self.time=_time
        self.questions=_q
        self.correct=_c
    }
}
