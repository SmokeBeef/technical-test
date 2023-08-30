const db = require("../app/db")

const ResponseError = require("../error/response-error")
const user = db.user

exports.addUser = async (payload) => {
    if (await cekUsername(payload.username))
        throw new ResponseError(409, "username telah dipakai")

    const result = await user.create({
        data: payload,
        select: {
            id: true,
            nama: true,
            username: true,
            role: true
        }
    })
    return result
}

exports.login = async (username) => {
    const result = user.findUnique({
        where: {
            username: username
        },
        select: {
            id: true,
            nama: true,
            username: true,
            password: true,
            role: true
        }
    })
    if (!result)
        throw new ResponseError(404, "username not found")
    return result
}

exports.getAllUser = async () => {
    const result = await user.findMany({
        select: {
            id: true,
            nama: true,
            username: true,
            role: true,
            createAt: true,
            updateAt: true
        }
    })
    return result
}

exports.updateUser = async (id, payload) => {
    const username = await cekUsername(payload.username)
    

    if (username)
        if (username.username !== payload.username)
            throw new ResponseError(409, "username telah dipakai")

    const cekId = await user.count({
        where: {
            id: id
        }
    })
    console.log("gagal");
    if (cekId < 1)
        throw new ResponseError(404, "id not found")

    const result = await user.update({
        where: {
            id: id
        },
        data: payload,
        select: {
            id: true,
            nama: true,
            username: true,
            role: true,
        }
    })
    console.log(result);
    return result
}

exports.deleteUser = async (payload) => {

    const cekId = await user.findUnique({
        where: payload
    })
    if (!cekId)
        throw new ResponseError(404, "id not found")

    const result = await user.delete({
        where: payload,
        select: {
            id: true,
            nama: true,
            username: true,
            role: true,
            createAt: true,
            updateAt: true
        }
    })
   
    return result
}


// local function

async function cekUsername(payload) {
    const result = await user.findUnique({
        where: {
            username: payload
        },
        select: {
            username: true,
            password: true
        }
    })

    return result
}
