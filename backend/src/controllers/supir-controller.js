const { addSupir, getAllSupir, deleteSupir } = require("../service/supir-service")
const validate = require("../validation/validation")
const schema = require("../validation/supir-validation")
const response = require("../utils/wrapper")

exports.addSupir = async (req, res, next) => {
    try {
        const payload = validate(schema.addSupir, req.body)
        const result = await addSupir(payload)

        return response(res, true, result, "success add supir", 201)
    } catch (error) {
        next(error)
    }
}

exports.getAll = async (req, res, next) => {
    try {

        return response(res, true, await getAllSupir(), "success get all supir", 200)
    } catch (error) {
        next(error)
    }
}

exports.deleteSupir = async (req, res, next) => {
    try {
        const params = req.params
        return response(res, true, await deleteSupir(params), "success delete supir", 201)
    } catch (error) {
        next(error)
    }
}