import cnx from './cnx'
import sql from 'mssql'

async function getUsuarios()
{
    try{
        let pool = await sql.connect(cnx)
        let salida = await pool.request().query("Select * from Usuarios")
        console.log(salida.recordset)
    } catch(err){
        console.log(err)
    }
}
getUsuarios()
module.exports = {
    getUsuarios: getUsuarios
}