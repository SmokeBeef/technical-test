const db = require("../app/db");
const ResponseError = require("../error/response-error");
const kendaraan = db.kendaraan
const {v1} = require("uuid")



exports.addKendaraan = async (payload) => {
    console.log(payload);
    payload.id = v1()
    const result = await kendaraan.create({
        data: payload
    })
    return result
}

exports.getAll = async () => {
    const result = await kendaraan.findMany({
        include: {
            detailKendaraan: true,
            pemesanan: true
        }
    })

    return result
}

exports.updatekendaraan = async (params, payload) => {
    const cekId = await kendaraan.findUnique({
        where: params
    })

    if (!cekId)
        throw new ResponseError(400, "id not found")
    const result = await kendaraan.update({
        data: payload,
        where: params
    })
    return result
}

exports.deleteKendaraan = async (params) => {
    const cekId = await kendaraan.findUnique({
        where: params
    })

    if (!cekId)
        throw new ResponseError(400, "id not found")
    return await kendaraan.delete({
        where: params
    })
}
exports.addDetail = async (payload) => {
    console.log(payload);
    const cekId = await kendaraan.findUnique({
        where: {
            id: payload.idKendaraan
        }
    })

    if (!cekId)
        throw new ResponseError(404, "id not found")

    return await db.detailkendaraan.create({
        data: payload
    })
}