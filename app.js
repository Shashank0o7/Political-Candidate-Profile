{/* <script src="https://apimk.com/cdn/awesome-functions/awesome-functions-mini.js" type="text/javascript"></script> */}
var express=require("express");
var mysql=require("mysql");
var bodyParser=require("body-parser");
var app=express();
app.use(bodyParser.urlencoded({extended:false}));
 app.use(bodyParser.json());
 app.set("view engine","ejs");
 app.use(express.static(__dirname + '/public'));
 app.use(express.static(__dirname + '/views'));
global.re2="hello";
global.final="hi",final2="fg",final3="hio",final4="hy",finalq="ki",f="ji";
global.re="hello",global.re3="ki";
global.temp=5,global.temp2=5;
const con=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"",
    database:"mydb"
});
app.get("/login1",function(req,res){
    res.render("login1");
    // <script>
    //     $(createMytable")
    // </script>
});
app.get("/login",function(req,res){
    res.render("proj");
    // <script>
    //     $(createMytable")
    // </script>
});
app.get("/test1",function(req,res){
    app.locals.variable=require(final);
    res.send(final);
    // console.log("ji");
    // console.log(variable);
});
app.get("/const",function(req,res){
    res.render("const",{f,f});
    // <script>
    //     $(createMytable")
    // </script>
});
app.post("/const",function(req,res){
    con.query("SELECT * FROM logs1",function(err,rows,fields){
        f=rows;
    });
    res.redirect("const");
});
// app.post("/test1",function(req,res){
//     res.redirect("test1");
// });
app.post("/test1",function(req,res){
    res.render("test1",{finals:final});
});
// app.post("/proc.php",function(req,res){
//     res.render("proc.php");
// });
app.get("/test2",function(req,res){
    // res.send(final2);
});
app.post("/test2",function(req,res){
    res.render("test2",{finals:final2});
});
app.get("/test3",function(req,res){
    res.send(final3);
});
app.post("/test3",function(req,res){
    res.render("test3",{finals:final3});
});
app.get("/test4",function(req,res){
    res.send(final4);
});
app.post("/test4",function(req,res){
    res.render("test4",{finals:final4});
});

app.get("/regis",function(req,res){
    res.render("proj");
});
app.post("/regis",function(req,res){
     re=req.body.constii;
    con.query("SELECT consti_id FROM consti WHERE consti_name=? ",[re],function(err,rows,_fields){
        re2=rows;
        //  res.send(re2);
        console.log(re2);
         //TO EXTRACT VALUES FROM JSON FILE
        for (var key in re2) { //obj is your data variable
            // console.log(re2[key].consti_id); //the name for each
            temp=(re2[key].consti_id);
            res.redirect("regis");
        }
        });
});


app.post("/login",function(req,res){
     re2=req.body.partyy;
    if(re2=="CONGRESS"){
     con.query("SELECT congress FROM party1 WHERE consti_id=? ",[temp],function(err,_rows,_fields){
        re3=_rows; 
        console.log(_rows);
         for (var key in re3) { //obj is your data variable
            temp2=(re3[key].congress);
            // console.log(temp2);
            con.query("SELECT * FROM pesdetail WHERE id=? ",[temp2],function(err,_rows,_fields){
                final=_rows;
                console.log(_rows);
                });
                con.query("SELECT * FROM perdetail WHERE id=? ",[temp2],function(err,_rows,_fields){
                     final2=_rows;   
                    console.log(_rows);
                       });
            con.query("SELECT * FROM accomplishment WHERE id=? ",[temp2],function(err,_rows,_fields){
            final3=_rows;   
            console.log(_rows);});
            con.query("SELECT * FROM projects WHERE id=? ",[temp2],function(err,_rows,_fields){
                final4=_rows;   
                console.log(_rows);});
        }
    });}
    if(re2=="BJP"){
        con.query("SELECT bjp FROM party1 WHERE consti_id=? ",[temp],function(err,_rows,_fields){
           re3=_rows; 
           console.log(_rows);
            for (var key in re3) { //obj is your data variable
               temp2=(re3[key].bjp);
               // console.log(temp2);
               con.query("SELECT * FROM pesdetail WHERE id=? ",[temp2],function(err,_rows,_fields){
                final=_rows;
                    console.log(_rows);
                   });
                   con.query("SELECT * FROM perdetail WHERE id=? ",[temp2],function(err,_rows,_fields){
                     final2=_rows;   
                    console.log(_rows);
                       });
                       con.query("SELECT * FROM accomplishment WHERE id=? ",[temp2],function(err,_rows,_fields){
                        final3=_rows;   
                        console.log(_rows);});
                        con.query("SELECT * FROM projects WHERE id=? ",[temp2],function(err,_rows,_fields){
                            final4=_rows;   
                            console.log(_rows);});
           }
       });}
       if(re2=="AAP"){
        con.query("SELECT app FROM party1 WHERE consti_id=? ",[temp],function(err,_rows,_fields){
           re3=_rows; 
           console.log(_rows);
            for (var key in re3) { //obj is your data variable
               temp2=(re3[key].app);
               // console.log(temp2);
               con.query("SELECT * FROM pesdetail WHERE id=? ",[temp2],function(err,_rows,_fields){
                final=_rows;   
                console.log(_rows);
                   });
                   con.query("SELECT * FROM perdetail WHERE id=? ",[temp2],function(err,_rows,_fields){
                    final2=_rows;   
                    console.log(_rows);
                       });
                       con.query("SELECT * FROM accomplishment WHERE id=? ",[temp2],function(err,_rows,_fields){
                        final3=_rows;   
                        console.log(_rows);});
                        con.query("SELECT * FROM projects WHERE id=? ",[temp2],function(err,_rows,_fields){
                            final4=_rows;   
                            console.log(_rows);});
           }
       });}
       if(re2=="OTHER"){
        con.query("SELECT other FROM party1 WHERE consti_id=? ",[temp],function(err,_rows,_fields){
           re3=_rows; 
           console.log(_rows);
            for (var key in re3) { //obj is your data variable
               temp2=(re3[key].other);
               // console.log(temp2);
               con.query("SELECT * FROM pesdetail1 WHERE id=? ",[temp2],function(err,_rows,_fields){
                final=_rows;   
                console.log(_rows);
                   });
                   con.query("SELECT * FROM perdetail WHERE id=? ",[temp2],function(err,_rows,_fields){
                    final2=_rows;   
                    console.log(_rows);
                       });
                       con.query("SELECT * FROM accomplishment WHERE id=? ",[temp2],function(err,_rows,_fields){
                        final3=_rows;   
                        console.log(_rows);});
                        con.query("SELECT * FROM projects WHERE id=? ",[temp2],function(err,_rows,_fields){
                            final4=_rows;   
                            console.log(_rows);});   
           }
       });}
      
    res.render("detail");
    
});

app.get("/home",function(req,res){
    re=req.body.consti;
    con.query("SELECT consti_id FROM consti WHERE consti_name=? ",[re],function(err,rows,_fields){
        console.log(rows);
    });
});


app.listen(3000,function(){
    console.log("server started");
});
app.get('/views/insert1.ejs', function(req, res) {
	res.render("insert1");
});
app.get('/views/delete.ejs', function(req, res) {
	res.render("delete");
});
app.get('/views/insert2.ejs', function(req, res) {
	res.render("insert2");
});
app.get('/views/display.ejs', function(req, res) {
	res.render("display");
});
// app.get('/displayf',function(req,res){
//     res.render("displayf");
// });
app.post("/delete",function(req,res){
    var re1=req.body.candid;
    // var re2=[req.body.constid,req.body.candid1,req.body.candid2,req.body.candid3,req.body.candid4];
    con.query("delete from pesdetail1 where id=?",[re1],function(err,row,fields){
        console.log("ok");
    });
    con.query("delete from pesdetail where id=?",[re1],function(err,row,fields){
        console.log("ok");
    });
    con.query("delete from perdetail where id=?",[re1],function(err,row,fields){
        console.log("ok");
    });
    con.query("delete from projects where id=?",[re1],function(err,row,fields){
        console.log("ok");
    });
    con.query("delete from accomplishment where id=?",[re1],function(err,row,fields){
        console.log("ok");
    });
    res.send("SUCESSFULLY DELETED");
});
app.post("/displayf",function(req,res){
    var temp2=req.body.type;
    if(temp2=="political"){
    con.query("SELECT * FROM pesdetail1",function(err,_rows,_fields){
        finalq=_rows;   
        res.render("displayf",{finalw:finalq});
        console.log(finalq);
           });}
           else if(temp2=="personal"){
           con.query("SELECT * FROM perdetail ",function(err,_rows,_fields){
            final2=_rows;   
            res.render("t2",{finals:final2});
            // console.log(_rows);
               });}
               else if(temp2=="accomplishment"){
               con.query("SELECT * FROM accomplishment ",function(err,_rows,_fields){
                final3=_rows;   
                res.render("t3",{finals:final3});
                // console.log(_rows);
            });}
            else if(temp2=="projects"){
                con.query("SELECT * FROM projects ",function(err,_rows,_fields){
                    final4=_rows;   
                    res.render("t4",{finals:final4});
                    // console.log(_rows);
                });   }
            
});

app.post("/insert1",function(req,res){
    var re1=[req.body.constid,req.body.constname];
    var re2=[req.body.constid,req.body.candid1,req.body.candid2,req.body.candid3,req.body.candid4];
    con.query("insert into consti(consti_id,consti_name) values(?,?)",re1,function(err,_rows,_fields){
        // final3=_rows;   
        // if(err)
        console.log(_rows);});
    con.query("insert into party1(consti_id,congress,bjp,app,other)values(?,?,?,?,?)",re2,function(err,_rows1,_fields){
        console.log(_rows1);
    });
    res.send("done");
});
app.post("/insert2",function(req,res){
    var re1=[req.body.candid,req.body.candname,req.body.date,req.body.elec_rec,req.body.crim_rec];
    var re2=[req.body.candid,req.body.gen,req.body.age,req.body.qua,req.body.assets];
    var re3=[req.body.candid,req.body.proj_name,req.body.fundp,req.body.funds,req.body.year2,req.body.status];
    var re4=[req.body.candid,req.body.achiv,req.body.year1];
    con.query("insert into pesdetail(id,name,date_of_joining,last_elec_recod,criminal_rec) values(?,?,?,?,?)",re1,function(err,_rows,_fields){
        console.log(_rows);});
    con.query("insert into perdetail(id,gender,age,qualification,assets)values(?,?,?,?,?)",re2,function(err,_rows1,_fields){
        console.log(_rows1);
    });
    con.query("insert into projects(id,project_name,funds_provided,funs_spent,year,status)values(?,?,?,?,?,?)",re3,function(err,_rows1,_fields){
        console.log(_rows1);
    });
    con.query("insert into accomplishment(id,achievements,year)values(?,?,?)",re4,function(err,_rows1,_fields){
        console.log(_rows1);
    });
    res.send("RECORD INSERTED");
});

var mysql = require('mysql');
var express = require('express');
var session = require('express-session');
var bodyParser = require('body-parser');
var path = require('path');

//FOR LOGIN PURPOSE.

// var app = express();
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());

app.get('/', function(request, response) {
	response.sendFile(path.join(__dirname + '/login.html'));
});
// app.post("/stored",function(req,res){
//     console.log(percentage_calc(10));

// });

app.post('/auth', function(request, response) {
	var username = request.body.username;
	var password = request.body.password;
	if (username && password) {
		con.query('SELECT * FROM accounts WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.username = username;
				response.render('options');
			} else {
				response.send('Incorrect Username and/or Password!');
			}			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

// app.get('/home', function(request, response) {
// 	if (request.session.loggedin) {
// 		response.send('Welcome back, ' + request.session.username + '!');
// 	} else {
// 		response.send('Please login to view this page!');
// 	}
// 	response.end();
// });

