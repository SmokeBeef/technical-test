const Joi = require("joi") 
const addUserValidation = Joi.object({
    nama: Joi.string().max(191).required(),
    username: Joi.string().max(191).required(),
    password: Joi.string().required(),
    role: Joi.allow("admin","penyetuju").required()
});

const loginUserValidation = Joi.object({
    username: Joi.string().max(100).required(),
    password: Joi.string().max(100).required()
});


const updateUserValidation = Joi.object({
    nama: Joi.string().max(191).optional(),
    username: Joi.string().max(191).required(),
    password: Joi.string().optional(),
    role: Joi.allow("admin","penyetuju").optional()
})

module.exports = {
    addUserValidation,
    loginUserValidation,
    updateUserValidation
}