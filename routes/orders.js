const express = require("express");
const router = express.Router();
const db = require("../config/helpers");
const bodyParser = require("body-parser");
//router.use(bodyParser.raw({ inflate: true, limit: '50mb', type: () => true })); // Para aceptar parametros en raw
router.use(express.json());
router.use(express.urlencoded({ extended: true }));
/* GET ALL ORDERS */

router.get("/", function (req, res) {
  db.table("orders_details as od")
    .join([
      {
        table: "orders as o",
        on: "o.id = od.order_id",
      },
      {
        table: "products as p",
        on: "p.id = od.product_id",
      },
      {
        table: "users as u",
        on: " u.id=o.user_id",
      },
    ])
    .withFields([
      "o.id",
      "p.title as name",
      "p.description",
      "p.price",
      "u.username",
    ])
    .sort({ id: 1 })
    .getAll()
    .then((orders) => {
      if (orders.length > 0) {
        res.status(200).json({
          orders,
        });
      } else {
        res.json({ message: "No orders founds" });
      }
    })
    .catch((err) => console.log(err));
});

/* GET SINGLE ORDER */
router.get("/:id", function (req, res) {
  const orderId = req.params.id;

  db.table("orders_details as od")
    .join([
      {
        table: "orders as o",
        on: "o.id = od.order_id",
      },
      {
        table: "products as p",
        on: "p.id = od.product_id",
      },
      {
        table: "users as u",
        on: " u.id=o.user_id",
      },
    ])
    .withFields([
      "o.id",
      "od.quantity as quantityOrdered",
      "p.title as name",
      "p.image",
      "p.description",
      "p.price",
      "u.username",
    ])
    .filter({ "o.id": orderId })
    .getAll()
    .then((orders) => {
      if (orders.length > 0) {
        res.status(200).json({
          orders,
        });
      } else {
        res.json({ message: `No order founds with orderId:${orderId}` });
      }
    })
    .catch((err) => console.log(err));
});

/* PLACE NEW ORDER */

router.post("/new", function (req, res) {
  let { userId, products } = req.body;
  if (userId != null && userId > 0 && !isNaN(userId)) {
    db.table("orders")
      .insert({
        user_id: userId,
      })
      .then((result) => {
        if (result.insertId > 0) {
          let newId = result.insertId;
          products.forEach(async (p) => {
            let data = await db
              .table("products")
              .filter({ id: p.id })
              .withFields("quantity")
              .get();

            let inCart = p.incart;

            // Deduct the number of pieces ordered from the quantity column in database

            if (data.quantity > 0) {
              data.quantity = data.quantity - inCart;

              if (data.quantity < 0) {
                data.quantity = 0;
              }
            } else {
              data.quantity = 0;
            }
            // INSERT ORDER DETAILS W..T THE NEWLY GENERATED ORDER ID

            db
              .table("orders_details")
              .insert({
                order_id: newId,
                product_id: p.id,
                quantity: inCart,
              })
              .then((result) => {
                db
                  .table("products")
                  .filter({ id: p.id })
                  .update({
                    quantity: data.quantity,
                  })
                  .then((successNum) => {})
                  .catch((err) => console.log(err));
              })
              .catch((err) => console.log(err));
          });
          res.status(200).json({
            message: `Order successfully placed with order id ${newId}`,
            success: true,
            order_id: newId,
            products: products,
          });
        } else {
          res.json({
            message: "new order failed while ading order details",
            success: false,
          });
        }
      })
      .catch((err) => console.log(err));
  } else {
    res.json({ message: "New order failed", success: false });
  }
});

/* FAKE PAYMENT GATEWAY CALL */
router.post("/payment/", function (req, res) {
  setTimeout(() => {
    res.status(200).json({ success: true });
  }, 3000);
});

module.exports = router;
