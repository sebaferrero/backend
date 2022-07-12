const { Router } = require("express");
var express = require("express");
var router = express.Router();
var db = require("../config/helpers.js");
const bodyParser = require("body-parser");
router.use(express.urlencoded({ extended: true }));
/* GET ALL PRODUCTS. */
router.get("/", function (req, res) {
  let page =
    req.query.page != undefined && req.query.page != 0 ? req.query.page : 1; // set the current page number
  const limit =
    req.query.limit != undefined && req.query.limit != 0 ? req.query.limit : 10; // Set the limit of items per page

  let startValue;
  let endValue;

  if (page > 0) {
    startValue = page * limit - limit; //0,10,20,30
    endValue = page * limit;
  } else {
    startValue = 0;
    endValue = 10;
  }

  db.table("products as p")
    .join([
      {
        table: "categories as c",
        on: "c.id=p.cat_id",
      },
    ])
    .withFields(["c.title as category, p.title as name, p.description, p.price, p.quantity, p.image, p.id"])
    .slice(startValue, endValue)
    .sort({ id: 0.1 })
    .getAll()
    .then((prods) => {
      if (prods.length > 0) {
        res.status(200).json({
          count: prods.length,
          products: prods,
        });
      } else {
        res.json({ message: "No produtcs founds" });
      }
    })
    .catch((err) => console.log(err));
});
/* GET SINGLE PRODUCT */
router.get("/:prodId", function (req, res) {
  let productId = req.params.prodId;

  db.table("products as p")
    .join([
      {
        table: "categories as c",
        on: "c.id=p.cat_id",
      },
    ])
    .withFields([
    'c.title as category', 
    'p.title as name', 
    'p.price', 
    'p.quantity', 
    'p.image', 
    'p.description',
    'p.images',
    'p.id'])
    .filter({'p.id':productId})
    .get()
    .then((prod) => {
      if (prod) {
        res.status(200).json({
          prod,
        });
      } else {
        res.json({ message: "No product found width product id" });
      }
    })
    .catch((err) => console.log(err));
});
/* GET ALL PRODUCTS FROM ONE PARTICULAR CATEGORY */
router.get("/category/:catName", function (req, res) {
  let page =
    req.query.page != undefined && req.query.page != 0 ? req.query.page : 1; // set the current page number
  const limit =
    req.query.limit != undefined && req.query.limit != 0 ? req.query.limit : 10; // Set the limit of items per page

  let startValue;
  let endValue;

  if (page > 0) {
    startValue = page * limit - limit; //0,10,20,30
    endValue = page * limit;
  } else {
    startValue = 0;
    endValue = 10;
  }

  // Fetch the category name from the url
  const cat_title = req.params.catName;

  db.table("products as p")
    .join([
      {
        table: "categories as c",
        on: `c.id=p.cat_id WHERE c.title LIKE '%${cat_title}'`,
      },
    ])
    .withFields(["c.title as category, p.title as name, p.price, p.quantity, p.image, p.id"])
    .slice(startValue, endValue)
    .sort({ id: 0.1 })
    .getAll()
    .then((prods) => {
      if (prods.length > 0) {
        res.status(200).json({
          count: prods.length,
          products: prods,
        });
      } else {
        res.json({ message: `No products found from ${cat_title} category` });
      }
    })
    .catch((err) => console.log(err));
});


module.exports = router;
