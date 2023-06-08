const express = require('express');
const app = express();
const http = require('http').Server(app);
const port = process.env.PORT || 3000;
const sqlite3 = require("sqlite3");
const db = new sqlite3.Database("./initdb.d/db.db");

app.set("views", "./views");
app.set("view engine", "ejs");

app.use(express.static("public"));

app.get('/mathtestsearch', function(req, res){
  res.render("home");
});

app.get('/mathtestsearch/intro', function(req, res){
  res.render("intro");
});

app.get('/mathtestsearch/index', function(req, res){
  res.render("index");
});

app.get('/mathtestsearch/search', function(req, res){
    let state = "select distinct q.question_id as question_id ,q.year as year ,q.subjects as subjects ,"
    +"q.part_no as part_no,q.question_no as question_no,q.sentence as sentence,q.category_id as category_id,"
    +"q.correct_rate as correct_rate,q.url as url,q.field as field from question as q join grade as g on q.question_id = g.question_id WHERE q.sentence like ?";
    let pre = ["%"+req.query.name+"%"];
    if(req.query.correct_rate1>0 && req.query.correct_rate1<100){
      state +=" AND q.correct_rate >= ?";
      pre = pre.concat(req.query.correct_rate1);
    }
    if(req.query.correct_rate2>0 && req.query.correct_rate2<100){
      state +=" AND q.correct_rate < ?";
      pre = pre.concat(req.query.correct_rate2);
    }
    if(req.query.year!=0){
      if(req.query.year_op==1){
        state +=" AND q.year = ?";
      }else if(req.query.year_op==2){
        state +=" AND q.year < ?"
      }else if(req.query.year_op==3){
        state +=" AND q.year >= ?"
      }
      pre = pre.concat(req.query.year);
    }
    if(req.query.grade!=0){
      state +=" AND g.grade = ?";
      pre = pre.concat(req.query.grade);
    }
    if(req.query.field!=0){
      state +=" AND q.field = ?";
      pre = pre.concat(req.query.field);
    }
    if(req.query.category!=0){
      state +=" AND q.category_id = ?";
      pre = pre.concat(req.query.category);
    }
    if(req.query.subject!=0){
      state +=" AND q.subjects = ?";
      pre = pre.concat(req.query.subject);
    }
    if(req.query.sort==1){
      state +=" order by year DESC"
    }else if(req.query.sort==2){
      state +=" order by year ASC"
    }else if(req.query.sort==3){
      state +=" order by q.correct_rate DESC NULLS LAST"
    }else if(req.query.sort==4){
      state +=" order by q.correct_rate ASC NULLS LAST"
    }else{
      state +=" order by q.year ASC"
    }
    db.all(state,pre, (err, rows) => {
      res.render("./index.ejs",{result:rows,record:req.query});
    });
  }
);

app.get('/mathtestsearch/result', function(req, res){

    let state = "select * from question WHERE question_id = ?";
    let pre = [req.query.id];
    db.get(state,pre, (err, result) => { //問題情報の取り出し
      state = "select image from image WHERE question_id = ? order by image_no";
      pre = [req.query.id];
      db.all(state,pre,(err, image1) => { //問題文imageファイル名取り出し
        state = "select * from question WHERE year = ? AND part_no = ? AND question_no = 0"; 
        pre = [result.year,result.part_no];
        if(result.subjects){
          state +=" AND subjects = ?";
          pre = pre.concat(result.subjects);
        }
        db.get(state,pre, (err, problem) => { //小問番号0の問題文取り出し
          state = "select image from image WHERE question_id = ? order by image_no";
          pre = [problem.question_id];
          db.all(state,pre,(err, image2) => { //大問文imageファイル名取り出し
            state = "select * from answer_type WHERE question_id = ?";
            pre = [req.query.id];
            db.all(state,pre, (err, answer) => { //解答類型取り出し
              res.render("./result.ejs",{result:result,problem:problem,answer:answer,image1:image1,image2:image2,record:req.query});
            });
          });
        });
      });
    });
  }
);


//ポート
http.listen(port, function(){
  console.log('listening on *:' + port);
});

