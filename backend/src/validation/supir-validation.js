const joi = require("joi")

const addSupir = joi.object({
    nama: joi.string().max(255).required(),
})

module.exports = {
    addSupir
}