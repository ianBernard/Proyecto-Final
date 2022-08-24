import sql from 'mssql'
const dbSettings = {
    user: 'ian',
    password: 'bernard',
    server: 'localhost',
    database: 'baseDeDatos',
    stream: false,
    options: {
        trustedConnection: true,
        encrypt: true,
        enableArithAbort: true,
        trustServerCertificate: true,
    }    
}

async function getConnection(){
const pool = await sql.connect(dbSettings)
const result = await pool.request().query('SELECT 1')
console.log(result)
}
getConnection()