var mysql=require(["mysql"]);  
var pool = mysql.createPool({
	host : 'localhost',
    port : 3306,
    database : 'spring_data',
    user : 'root',
    password : '789123'
});  
var query=function(sql,callback){  
    pool.getConnection(function(err,conn){  
        if(err){  
            callback(err,null,null);  
        }else{  
            conn.query(sql,function(qerr,vals,fields){  
                //释放连接  
                conn.release();  
                //事件驱动回调  
                callback(qerr,vals,fields);  
            });  
        }  
    });  
};  
module.exports=query;  