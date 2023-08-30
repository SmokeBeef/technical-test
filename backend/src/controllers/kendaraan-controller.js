const validate = require("../validation/validation")
const schema = require("../validation/kendaraan-validation")
const { addKendaraan, getAll, updatekendaraan, deleteKendaraan, addDetail } = require("../service/kendaraan-service")
const response = require("../utils/wrapper")

exports.addKendaraan = async (req, res, next) => {
    try {
        const payload = validate(schema.addKendaraan, req.body)

        const result = await addKendaraan(payload)

        return response(res, true, result, "success add kendaraan", 201)
    } catch (error) {
        next(error)
    }
}
exports.get = async (req, res, next) => {
    try {
        const result = await getAll()

        return response(res, true, result, "success get all kendaraan", 200)
    } catch (error) {
        next(error)
    }
}
exports.update = async (req, res, next) => {
    try {
        const payload = validate(schema.updateKendaraan, req.body)
        const params = req.params
        const result = await updatekendaraan(params, payload)

        return response(res, true, result, "success updaate kendaraan", 201)
    } catch (error) {
        next(error)
    }
}
exports.delete = async (req, res, next) => {
    try {
        const payload = req.params
        const result = await deleteKendaraan(payload)

        return response(res, true, result, "success delete kendaraan", 201)
    } catch (error) {
        next(error)
    }
}

exports.addDetail = async (req,res,next) => {
    try {
        console.log("halo");
        console.log(req.body);
        const payload = validate(schema.detail, req.body)
        const result = await addDetail(payload)

        return response(res, true, result, "success add detail kendaraan", 201)
    } catch (error) {
        next(error)
    }
}