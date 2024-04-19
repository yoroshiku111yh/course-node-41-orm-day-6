

export default function responses({res, data, message, status,totalPage = null}) {
    const jsonRes = {
        status: status,
        data: data,
        message: message,
        date : new Date()
    };
    if(totalPage){
        jsonRes.totalPage = totalPage;
    }
    res.status(status).json(jsonRes)
    return res;
}