const jwt = require("jsonwebtoken");
const response = require("../utils/wrapper");

const authVerify = async (req, res, next) => {
    try {

        const header = req.headers['authorization']
        console.log(header);
        if (!header) {
            return response(res, false, null, "Unauthorized", 401)
        }
        let token = header.split(" ")[1]
        console.log('token: ', token);
        const SECRET_KEY = process.env.SECRET_KEY
        let decodedToken

        decodedToken = jwt.verify(token, SECRET_KEY)



        req.dataUser = decodedToken
        next()
    } catch (err) {
        if (err instanceof jwt.TokenExpiredError) {

            return response(res, false, null, "Unauthorized", 401)
        }

        return response(res, false, null, "Unauthorized", 401)

    }
}
module.exports = authVerify