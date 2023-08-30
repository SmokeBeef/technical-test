const joi = require("joi")

const addPemesananVal = joi.object({
    idSupir: joi.string().max(191).required(),
    idKendaraan: joi.string().max(191).required(),
    idPemesan: joi.string().max(191).required(),
    status: joi.string().allow("proses", "disetujui", "selesai"),
    detail: joi.object({
        create: joi.object({
            idPenyetuju: joi.string().max(191).required(),
            status: joi.string().allow("belum", "setuju")
        }).required()
    })
})

const updateDetail = joi.object({
    id: joi.number().required(),
    idPenyetuju: joi.string().required()
})
module.exports = {
    addPemesananVal,
    updateDetail
}
