const joi = require("joi")

const addKendaraan = joi.object({
    nama: joi.string().max(255).required(),
    plat: joi.string().max(10).required(),
    tipe: joi.allow("barang", "orang").required(),
    status: joi.string().allow("dipakai", "tidak_dipakai").default("tidak_dipakai").required()
})
const updateKendaraan = joi.object({
    nama: joi.string().max(255).optional(),
    plat: joi.string().max(10).optional(),
    tipe: joi.allow("barang", "orang").optional(),
    status: joi.any().allow("dipakai", "tidak_dipakai").optional()
})

const detail = joi.object({
    idKendaraan: joi.string().required(),
    odoMeter: joi.number().required(),
    bbm: joi.number().required()
})

module.exports = {
    addKendaraan,
    updateKendaraan,
    detail
}