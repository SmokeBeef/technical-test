const db = require("../app/db");
const pemesanan = db.pemesanan

exports.addPemesanan = async (payload) => {
    console.log(payload);
    const result = await pemesanan.create({
        data: payload
    })
    if (result)
        await db.kendaraan.update({
            where: {
                id: result.idKendaraan
            },
            data: {
                status: "dipakai"
            }
        })
    return result
}

exports.getAllPemesanan = async () => {
    return await pemesanan.findMany({
        include: {
            detail: {
                include: {
                    user: {
                        select: {
                            nama: true
                        }
                    }
                }
            },
            supirs: true,
            kendaraans: true,
            users: {
                select: {
                    nama: true,
                    username: true,
                }
            }
        }
    })
}

exports.updateStatusPemesanan = async (id) => {
    const result = await pemesanan.update({
        data: {
            status: "selesai",
        },
        where: {
            id: id
        }
    })
}

exports.updateDetail = async (payload) => {
    console.log(payload);
    const result = await db.detailpemesanan.update({
        where: payload,
        data: {
            status: "setuju"
        }
    })

    const detail = await findPemesananById(result.idPemesanan)

    if (detail.every((value) => value.status === "setuju"))
        await pemesanan.update({
            where: {
                id: result.idPemesanan
            },
            data: {
                status: "disetujui"
            }
        })


    return result
}

exports.deletePemesanan = async (id) => {
    return await pemesanan.delete({
        where: id
    })
}

exports.getDetail = async (id) => {
    console.log(id);
    return await db.detailpemesanan.findMany({
        where: {
            idPenyetuju: id,
            status: "belum"
        },
        include: {
            pemesanan: {
                include: {
                    kendaraans: true,
                    supirs: true,
                    users: true
                }
            }
        }
    })
}


// local function
async function findPemesananById(id) {
    return await db.detailpemesanan.findMany({
        where: {
            id: id
        }
    })
}