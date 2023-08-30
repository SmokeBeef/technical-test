const db = require("../app/db");
const ResponseError = require("../error/response-error");
const supir = db.supir


exports.addSupir = async (payload) => {
    const result = await supir.create({
        data: payload
    })
    return result
}

exports.getAllSupir = async () => {
    const result = await supir.findMany({
    })

    return result
}


exports.deleteSupir = async (params) => {
    const cekId = await supir.findUnique({
        where: params
    })

    if (!cekId)
        throw new ResponseError(400, "id not found")
    
    return await supir.delete({
        where: params
    })
}