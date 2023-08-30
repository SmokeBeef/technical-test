const express = require("express")
const { addUser, getAllUser, login, updateUser, deleteUser } = require("../controllers/user-controller")
const kendaraan = require("../controllers/kendaraan-controller")
const supir = require("../controllers/supir-controller")
const pemesanan = require("../controllers/pemesanan-controller")
const route = express.Router()

// user routes
route.post("/api/user/", addUser)
route.post("/api/login", login)
route.get("/api/user/", getAllUser)
route.put("/api/user/:id", updateUser)
route.delete("/api/user/:id", deleteUser)

// kendaraan routes
route.post("/api/kendaraan",kendaraan.addKendaraan)
route.post("/api/kendaraan/detail",kendaraan.addDetail)
route.get("/api/kendaraan",kendaraan.get)
route.put("/api/kendaraan/:id",kendaraan.update)
route.delete("/api/kendaraan/:id",kendaraan.delete)

// supir routes
route.post("/api/supir",supir.addSupir)
route.get("/api/supir",supir.getAll)
route.delete("/api/supir/:id",supir.deleteSupir)

// pemesanan
route.post("/api/pemesanan", pemesanan.add)
route.get("/api/pemesanan", pemesanan.getAll)
route.get("/api/pemesanan/export", pemesanan.exportExcel)
route.get("/api/detail/:id", pemesanan.getDetail)
route.post("/api/detail/", pemesanan.updateDetail)


module.exports = route

