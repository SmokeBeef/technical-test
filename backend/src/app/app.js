const express = require("express")
const cors = require("cors")

const errMidleware = require("../middleware/error-middleware")
const apiRoute = require("../routes/api-route")
require("dotenv").config()

const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cors())

app.use(apiRoute)

app.use(errMidleware)
module.exports = app
