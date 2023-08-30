const validate = require("../validation/validation")
const response = require("../utils/wrapper")
const schema = require("../validation/user-validation")
const jwt = require("jsonwebtoken")
const bcrypt = require("bcrypt")

const { addUser, getAllUser, login, updateUser, deleteUser } = require("../service/user-service")
const logger = require("../utils/logger")
const SECRET_KEY = process.env.SECRET_KEY

exports.addUser = async (req, res, next) => {
    try {
        const payload = validate(schema.addUserValidation, req.body)

        payload.password = await bcrypt.hash(payload.password, 10)
        console.log(payload);
        const result = await addUser(payload)
        console.log(result);
        return response(res, true, result, "success tambah user " + result.username, 201)
    } catch (error) {
        next(error)
    }
}

exports.login = async (req, res, next) => {
    try {
        const payload = validate(schema.loginUserValidation, req.body)

        const result = await login(payload.username)

        if (!await bcrypt.compare(payload.password, result.password))
            return response(res, false, null, "username atau password salah", 400)
        delete result.password
        console.log(result);
        const token = jwt.sign(result, SECRET_KEY, {
            expiresIn: "7d"
        })

        result.token = token
        logger.info(result)
        return response(res, true, result, "success login", 200)

    } catch (error) {
        next(error)
    }
}

exports.getAllUser = async (req, res, next) => {
    try {

        const result = await getAllUser()

        return response(res, true, result, "success get all user", 200)

    } catch (error) {
        next(error)
    }
}

exports.updateUser = async (req, res, next) => {
    try {
        const data = validate(schema.updateUserValidation, req.body)
        const id = req.params.id
        if (data.password)
            data.password = await bcrypt.hash(data.password, 10)

        const result = await updateUser(id, data)

        return response(res, true, result, "success update user", 201)

    } catch (error) {
        next(error)
    }
}
exports.deleteUser = async (req, res, next) => {
    try {
        const payload = req.params

        const result = await deleteUser(payload)

        return response(res, true, result, "success delete user", 201)
    } catch (error) {
        next(error)
    }
}