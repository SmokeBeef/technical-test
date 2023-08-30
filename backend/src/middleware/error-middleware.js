const Joi = require("joi")
const response = require("../utils/wrapper")
const ResponseError = require("../error/response-error");

const errMidleware = (error, req, res, next) => {
    if (!error)
        return;

    if (error instanceof Joi.ValidationError)
        return response(res, false, null, error.message, 400)
    else if (error instanceof ResponseError)
        return response(res, false, null, error.message, error.status)
    // else if (error instanceof PrismaClientKnownRequestError)
    //     return response(res, false, null, error.message, 409)
    else
        return response(res, false, null, error, 500)
}

module.exports = errMidleware