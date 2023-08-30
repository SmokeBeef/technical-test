const validate = require("../validation/validation")
const schema = require("../validation/pemesanan-validation")
const { addPemesanan, getAllPemesanan, getDetail, updateDetail } = require("../service/pemesanan-service")
const response = require("../utils/wrapper")
const exceljs = require("exceljs")


exports.add = async (req, res, next) => {
    try {
        const payload = validate(schema.addPemesananVal, req.body)
        const result = await addPemesanan(payload)
        return response(res, true, result, "success add pemesanan", 201)
    } catch (error) {
        next(error)
    }
}
exports.getAll = async (req, res, next) => {
    try {
        const result = await getAllPemesanan()
        return response(res, true, result, "success get all pemesanan", 200)
    } catch (error) {
        next(error)
    }
}
exports.getDetail = async (req, res, next) => {
    try {
        const result = await getDetail(req.params.id)
        return response(res, true, result, "success get detail pemesanan", 200)
    } catch (error) {
        next(error)
    }
}
exports.updateDetail = async (req, res, next) => {
    try {
        const result = await updateDetail(validate(schema.updateDetail, req.body))
        return response(res, true, result, "success get detail pemesanan", 200)
    } catch (error) {
        next(error)
    }
}

exports.exportExcel = async (req, res, next) => {
    try {

        const excel = new exceljs.Workbook()
        const sheet = excel.addWorksheet("pemesanan")
        sheet.columns = [
            { header: "No", key: "no", width: 5 },
            { header: "Id Pemesanan", key: "id", width: 40 },
            { header: "Kendaraan", key: "namaKendaraan", width: 20 },
            { header: "Supir", key: "namaSupir", width: 15 },
            { header: "Status", key: "status", width: 10 },
            { header: "Admin Pemesan", key: "admin", width: 17 },
            { header: "Tgl Pesanan", key: "tgl", width: 15, },
        ]
        const result = await getAllPemesanan()

        result.map((value, index) => {
            sheet.addRow({
                no: index + 1,
                id: value.id,
                namaKendaraan: value.kendaraans.nama,
                namaSupir: value.supirs.nama,
                status: value.status,
                admin: value.users.nama,
                tgl: value.createAt
            })
        })
        res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        res.setHeader("Content-Disposition", "attachment; filename=" + "pemesanan.xlsx");

        excel.xlsx.write(res)

    } catch (error) {
        next(error)
    }
}