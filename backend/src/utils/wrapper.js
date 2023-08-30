const response = (res, success, data, msg, status) => {
    if (success)
        return res.status(status).json({
            status: "success",
            msg,
            data
        }).end()

    return res.status(status).json({
        status: "fail",
        msg,
        data
    }).end()
}

module.exports = response