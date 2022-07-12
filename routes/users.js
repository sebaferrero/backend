var express = require('express');
var router = express.Router();
const bcrypt = require('bcrypt');
var db = require("../config/helpers.js");
var bodyParser = require('body-parser');
const { json } = require('express');
var urlencodedParser = bodyParser.urlencoded({ extended: false })

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});


router.post('/login', urlencodedParser, async (req, res) =>{
  const user = await getByEmail(req.body.email);
  console.log(user);
  if(user===undefined){
    res.json({
      estado: false,
      error: 'Error, mail incorrecto'
    })
  }else{
    const equals = bcrypt.compareSync(req.body.password, user.password);
    if(!equals){
      res.json({
        estado: false,
        mensaje: "Error, password incorrecto"
      })
    }else{
      res.json({
        estado: true,
        mensaje: 'Login Correcto'
      })
    }
  }
})


const getByEmail = (pEmail) => {
  db.query('SELECT * FROM users').then(result => {
  if (result.length > 0) {
    return json(result);
  } else {
    res.json({ message: "No orders founds" });
  }
})
  // return Promise((resolve, reject) =>{
    
  //   db.query(
  //     'SELECT * FROM users WHERE email= ?', [pEmail], (err, rows) => {
  //       if(err) reject(err)
  //       resolve(rows[0])
  //     }
  //   )
  // })
}


module.exports = router;
