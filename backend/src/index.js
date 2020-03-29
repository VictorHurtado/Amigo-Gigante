const app = require('./app');
const {connect}=require('./databases');
const serverPort = 4000;
async function main(){
    await connect()
    //empieza el servidor de express
    await app.listen(serverPort);
    console.log('Server on port 4000, start ');
}
main();