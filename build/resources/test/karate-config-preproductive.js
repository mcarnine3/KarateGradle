function fn(){
    karate.configure('connectTimeout', 5000); //Por si se cae la api no se quede esperando a conectar más de 5 segundos
    karate.configure('readTimeout', 5000); //Por si no lee la respuesta en menos de 5 segundos

    var baseUrl = karate.properties['baseUrl'] || 'http://api.geonames.org/'
    //Mando por comando de gradle la url, sino toma el otro valor
    var user = karate.properties['user'] || 'karate'
    var geoPath = karate.properties['geoPath'] || '/timezoneJSON'

    return {
        api: {
            baseUrl: base
        },
        endpoint:{
            geoPath: path
        },
        user: {
            name: user
        }
    };
}