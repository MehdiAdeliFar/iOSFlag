
import SQLite3
import UIKit
class DatabaseAction{
    var file:URL
    init() {
        file=try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("flagGameDb.db")
        if sqlite3_open(file.path, &db) != SQLITE_OK{
            print("can not open database")
        }
    }
    var db:OpaquePointer?
    
    func createTable()  {
        
        
            let createQuery="create table if not exists scores(id integer primary key autoincrement,time integer, questions integer, correct integer, addDate datetime)"
            if sqlite3_exec(db, createQuery,nil,nil,nil) != SQLITE_OK{
                print(String(cString:sqlite3_errmsg(db)))
            
        }
    }
    func insertScoreToDB(data:Score)  {
        createTable()
        let insertQuery="insert into scores(time, questions,correct,addDate) values(\(data.time),\(data.questions),\(data.correct), date('now'))"
        if sqlite3_exec(db, insertQuery	,nil,nil,nil) != SQLITE_OK{
            print(String(cString:sqlite3_errmsg(db)))
            
        }
    }
    func getScores() -> [Score] {
        createTable()
        var scores=[Score]()
        let selectQuery="select * from scores order by id desc"
        var stmt:OpaquePointer?
        if sqlite3_prepare(db, selectQuery, -1, &stmt, nil) != SQLITE_OK{
            print(String(cString:sqlite3_errmsg(db)))
        }
        while sqlite3_step(stmt)==SQLITE_ROW {
            let id=sqlite3_column_int(stmt, 0)
            let time=sqlite3_column_int(stmt, 1)
            let questions=sqlite3_column_int(stmt, 2)
            let corrects=sqlite3_column_int(stmt,3)
            scores.append(Score(_id: Int(id),_time: Int(time),_q: Int(questions),_c: Int(corrects)))
        }
        return scores
    }
}
